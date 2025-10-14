import Foundation
import SQLite
import ZTronDataModel
import ZTronRouter
import os

public final class SerializableToolsRouter: SerializableNode {
    private static let logger: os.Logger = .init(subsystem: "ZTronSerializable", category: "SerializableToolsRouter")
    public let router: ZTronRouter<Empty, SerializableToolNode, Empty>
    
    public init() {
        self.router = .init()
    }
    
    public func writeTo(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, shouldValidateFK: Bool) throws {
        guard let foreignKeys = foreignKeys as? SerializableToolForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type \(String(describing: SerializableToolForeignKeys.self)) in \(#function) on type \(#file)"
            )
        }
        
        if shouldValidateFK {
            let firstInvalidFK = try foreignKeys.validate(on: db)
            
            if let firstInvalidFK = firstInvalidFK {
                throw SerializableException.invalidForeignKeyException(reason: firstInvalidFK)
            }
        }
        
        if self.router.getMaxDepth() <= 0 {
            #if DEBUG
            Self.logger.info("Attempted to serialize empty tools router for \(self.toString()).")
            #endif
            return
        }
        
        // Router should have depth 2
        if router.getMaxDepth() > 2 {
            throw SerializableException.illegalArgumentException(
                reason: "At the time of coding, tools with slave tools are not allowed in \(self.toString()). Consider checking logic in \(self.toString())"
            )
        }

        
        let toolsPositions = router.map { _, output in
            return output.getPosition()
        }
        
        if !Validator.validatePositions(toolsPositions) {
            throw SerializableException.validationException(
                reason: "Tools positions \(String(describing: toolsPositions)) are not valid in \(#file) -> \(#function) for tab \(self.toString())"
            )
        }
        
        try self.router.forEach { _, output in
            try output.writeTo(db: db, with: foreignKeys, shouldValidateFK: shouldValidateFK)
        }
    }
    
    public func existsOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws -> Bool {
        guard let foreignKeys = foreignKeys as? SerializableToolForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type \(String(describing: SerializableToolForeignKeys.self)) in \(#function) on type \(#file)"
            )
        }

        
        let allTools = self.router.map { _, output in
            return output
        }
        
        for tool in allTools {
            if !(try tool.existsOn(db: db, with: foreignKeys, propagate: propagate)) {
                return false
            }
        }
        
        #if DEBUG
        Self.logger.info("Tools router \(self.toString()) exists on db")
        #endif
        
        return true
    }
    
    public func toString() -> String {
        var description: String = ""
        
        self.router.forEach { absolutePath, output in
            description += output.toString()
        }
        
        return description
    }
    
    
    public func deleteDanglingReferencesOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws {
        guard let foreignKeys = foreignKeys as? SerializableToolForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "Expected foreignKeys of type \(String(describing: SerializableToolForeignKeys.self)) in \(#file) -> \(#function)"
            )
        }

        if self.router.getMaxDepth() > 2 {
            throw SerializableException.validationException(
                reason: "Tools with slave tools are unsupported in \(#file) -> \(#function) for tab \(self.toString())"
            )
        }
        
        if propagate {
            try self.router.forEach { absolutePath, output in
                try output.deleteDanglingReferencesOn(db: db, with: foreignKeys, propagate: propagate)
            }
        }

        var toolsForThisTab: [String: SerializableToolNode] = [:]
        
        self.router.forEach { absolutePath, toolModel in
            toolsForThisTab[toolModel.getName()] = toolModel
        }
        
        try DBMS.CRUD.batchDeleteToolsForTab(
            for: db,
            tab: foreignKeys.getTab(),
            map: foreignKeys.getMap(),
            game: foreignKeys.getGame(),
            shouldRemove: { tool in
                return toolsForThisTab[tool.getName()] == nil
            },
            shouldDecreasePositions: false
        )
    }
}
