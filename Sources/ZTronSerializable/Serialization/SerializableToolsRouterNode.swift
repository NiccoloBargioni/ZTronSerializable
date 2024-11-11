import Foundation
import SQLite
import ZTronDataModel
import ZTronRouter
import os

public final class SerializableToolsRouterNode: SerializableNode {
    private static let logger: os.Logger = .init(subsystem: "ZTronSerializable", category: "SerializableToolsRouterNode")
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
        
        // Router should have depth 2
        if router.getMaxDepth() <= 1 || router.getMaxDepth() > 2 {
            throw SerializableException.illegalArgumentException(
                reason: "At the time of coding, tools with slave tools are not allowed in \(self.toString()). Consider checking syntax"
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
}
