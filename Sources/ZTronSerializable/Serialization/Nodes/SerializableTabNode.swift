import Foundation
import ZTronDataModel
import SQLite
import os

/// - `TAB(name, position, iconName, map, game)`
/// - `PK(name, map, game)`
/// - `FK(map, game) REFERENCES MAP(name, game) ON DELETE CASCADE ON UPDATE CASCADE`
public final class SerializableTabNode: SerializableNode {
    @Lowercased private var name: String
    private let position: Int
    @Lowercased private var iconName: String
    private let tools: SerializableToolsRouter
    
    private static let logger: os.Logger = .init()
    
    public init(name: String, position: Int, iconName: String, tools: SerializableToolsRouter) {
        self.name = name
        self.position = position
        self.iconName = iconName
        self.tools = tools
    }

    public func writeTo(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, shouldValidateFK: Bool) throws {
        guard let foreignKeys = foreignKeys as? SerializableTabForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "Expected foreignKeys of type \(String(describing: SerializableTabForeignKeys.self)) in \(#file) -> \(#function)"
            )
        }

        if shouldValidateFK {
            let firstInvalidFK = try foreignKeys.validate(on: db)
            
            if let firstInvalidFK = firstInvalidFK {
                throw SerializableException.invalidForeignKeyException(reason: firstInvalidFK)
            }
        }
        
        if self.tools.router.getMaxDepth() > 2 {
            throw SerializableException.validationException(
                reason: "Tools with slave tools are unsupported in \(#file) -> \(#function) for tab \(self.toString())"
            )
        }
            
        
        
        let toolsPositions = self.tools.router.map { _, output in
            return output.getPosition()
        }
        
        if !Validator.validatePositions(toolsPositions) {
            throw SerializableException.validationException(
                reason: "Tools positions \(String(describing: toolsPositions)) are not valid in \(#file) -> \(#function) for tab \(self.toString())"
            )
        }
        
        
        try DBMS.CRUD.insertIntoTab(
            or: .ignore,
            for: db,
            name: self.name,
            position: self.position,
            iconName: self.iconName,
            game: foreignKeys.getGame(),
            map: foreignKeys.getMap()
        )
        
        try self.tools.router.forEach { _, tool in
            try tool.writeTo(
                db: db,
                with: SerializableTabsForeignKeys(tab: self.name, tabFK: foreignKeys),
                shouldValidateFK: shouldValidateFK
            )
        }
    }
    
    public func existsOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws -> Bool {
        guard let foreignKeys = foreignKeys as? SerializableTabForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "Expected foreignKeys of type \(String(describing: SerializableTabForeignKeys.self)) in \(#file) -> \(#function)"
            )
        }
        
        let tabExists = try DBMS.CRUD.tabExists(for: db, tab: self.name, map: foreignKeys.getMap(), game: foreignKeys.getGame())
        
        if tabExists {
            if propagate {
                let tools = self.tools.router.map { _, output in
                    return output
                }
                
                for tool in tools {
                    let toolExists = try tool.existsOn(
                        db: db,
                        with: SerializableTabsForeignKeys(tab: self.name, tabFK: foreignKeys),
                        propagate: propagate
                    )
                    
                    if !toolExists {
                        return false
                    }
                }
                
                #if DEBUG
                Self.logger.info("Tab \(self.toString()) with FK \(foreignKeys.toString()) exists on db")
                #endif
                return true
            } else {
                #if DEBUG
                Self.logger.info("Tab \(self.toString()) with FK \(foreignKeys.toString()) exists on db")
                #endif
                return true
            }
        } else {
            return false
        }
    }
    
    public func toString() -> String {
        return """
            TAB(
                name: \(self.name),
                position: \(self.position),
                iconName: \(self.iconName)
            )
        """
    }
    
    public func getPosition() -> Int {
        return self.position
    }
    
}
