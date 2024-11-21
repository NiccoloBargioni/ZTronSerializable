import Foundation
import ZTronDataModel
import SQLite
import os

/// - `MAP(name, position, assetsImageName, game)`
/// - `PK(name, game)`
/// - `FK(game) REFERENCES GAME(name) ON DELETE CASCADE ON UPDATE CASCADE`
public final class SerializableMapNode: SerializableNode {
    private static let logger: os.Logger = .init(subsystem: "ZTronSerializable", category: "SerializableMapNode")
    @Lowercased private var name: String
    private let position: Int
    private let assetsImageName: String
    private let tabs: SerializableTabsRouter
    
    public init(name: String, position: Int, assetsImageName: String, tabs: SerializableTabsRouter) {
        self.name = name
        self.position = position
        self.assetsImageName = assetsImageName
        self.tabs = tabs
    }
    
    
    public func writeTo(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, shouldValidateFK: Bool) throws {
        guard let foreignKeys = foreignKeys as? SerializableMapForeignKeys else {
            throw SerializableException.illegalArgumentException(reason: "Expected foreign keys of type \(String(describing: SerializableMapForeignKeys.self)) in \(#function) @ \(#file) for map \(self.name)")
        }

        if shouldValidateFK {
            let firstInvalidFK = try foreignKeys.validate(on: db)
            
            if let firstInvalidFK = firstInvalidFK {
                throw SerializableException.invalidForeignKeyException(reason: firstInvalidFK)
            }
        }

        let tabsPositions = self.tabs.router.map { _, tab in
            return tab.getPosition()
        }
        
        if !Validator.validatePositions(tabsPositions) {
            throw SerializableException.validationException(
                reason: "Could not validate positions of tabs \(tabsPositions) for map \(self.toString()) with fk: \(foreignKeys.toString())"
            )
        }
        
        try DBMS.CRUD.insertIntoMap(
            or: .ignore,
            for: db,
            name: self.name,
            position: self.position,
            assetsImageName: self.assetsImageName,
            game: foreignKeys.getGame()
        )
        
        
        try self.tabs.router.forEach { _, tab in
            try tab.writeTo(
                db: db,
                with: SerializableTabForeignKeys(map: self.name, mapFK: foreignKeys),
                shouldValidateFK: shouldValidateFK
            )
        }
    }
    
    public func existsOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws -> Bool {
        guard let foreignKeys = foreignKeys as? SerializableMapForeignKeys else {
            throw SerializableException.illegalArgumentException(reason: "Expected foreign keys of type \(String(describing: SerializableMapForeignKeys.self)) in \(#function) @ \(#file) for map \(self.name)")
        }
        
        let mapExists = try DBMS.CRUD.mapExists(for: db, map: self.name, game: foreignKeys.getGame())
        
        if mapExists {
            if propagate {
                let tabs = self.tabs.router.map { _, output in
                    return output
                }
                
                for tab in tabs {
                    if !(try tab.existsOn(
                        db: db,
                        with: SerializableTabForeignKeys(map: self.name, mapFK: foreignKeys),
                        propagate: propagate
                    )
                ) {
                        return false
                    }
                }
                
                #if DEBUG
                Self.logger.info("Map \(self.toString()) with FK \(foreignKeys.toString()) exists on db")
                #endif
                
                return true
            } else {
                #if DEBUG
                Self.logger.info("Map \(self.toString()) with FK \(foreignKeys.toString()) exists on db")
                #endif
                
                return true
            }
        } else {
            return false
        }
    }
    
    public func toString() -> String {
        return """
        MAP(
            name: \(self.name),
            position: \(self.position),
            assetsImageName: \(self.assetsImageName)
        )
        """
    }
    
    public func getPosition() -> Int {
        return self.position
    }

}
