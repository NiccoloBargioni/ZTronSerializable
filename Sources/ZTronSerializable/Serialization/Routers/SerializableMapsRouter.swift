import Foundation
import SQLite
import ZTronDataModel
import ZTronRouter
import os

public final class SerializableMapsRouter: SerializableNode {
    private static let logger: os.Logger = .init(subsystem: "ZTronSerializable", category: "SerializableMapsRouter")
    public let router: ZTronRouter<Empty, SerializableMapNode, Empty>
    
    public init() {
        self.router = .init()
    }
    
    
    public func writeTo(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, shouldValidateFK: Bool) throws {
        guard let foreignKeys = foreignKeys as? SerializableMapForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type \(String(describing: SerializableMapForeignKeys.self)) in \(#function) on type \(#file)"
            )
        }
        
        if shouldValidateFK {
            let firstInvalidFK = try foreignKeys.validate(on: db)
            
            if let firstInvalidFK = firstInvalidFK {
                throw SerializableException.invalidForeignKeyException(reason: firstInvalidFK)
            }
        }
        
        if self.router.getMaxDepth() <= 1 {
            #if DEBUG
            Self.logger.info("Attempted to serialize empty maps router for \(self.toString()).")
            #endif
            return
        }
        
        // Router should have depth 2
        if router.getMaxDepth() > 3 {
            #if DEBUG
                Self.logger.info("At the time of coding, only a few maps with dependency tree of depth 3 (including root symbol) exist. Check your logic in \(self.toString())")
            #endif
        }
        
        var mapsPositionsByDepth: [Int: [Int]] = [:]
        
        router.forEach { absolutePath, output in
            if mapsPositionsByDepth[absolutePath.count - 1] == nil {
                mapsPositionsByDepth[absolutePath.count - 1] = .init()
            }
            
            mapsPositionsByDepth[absolutePath.count - 1]?.append(output.getPosition())
        }
        
        for depth in mapsPositionsByDepth.keys {
            if let positionsForDepth = mapsPositionsByDepth[depth] {
                if !Validator.validatePositions(positionsForDepth) {
                    throw SerializableException.validationException(
                        reason: "Maps positions \(String(describing: positionsForDepth)) are not valid in \(#file) -> \(#function) for tab \(self.toString())"
                    )
                }
            }
        }
        
        try self.router.forEach { path, output in
            try output.writeTo(db: db, with: foreignKeys, shouldValidateFK: shouldValidateFK)
                        
            if path.count > 2 {
                guard let master = self.router.peek(at: Array.array(subsequence: path.prefix(upTo: path.count - 1))) else {
                    fatalError("Gaps not allowed in \(String(describing: Self.self)) for \(self.toString())")
                }
                let slave = output.getName()
                
                try SerializableSubmapRelationshipNode(
                    master: master.getName(),
                    slave: slave
                ).writeTo(
                    db: db,
                    with: foreignKeys,
                    shouldValidateFK: shouldValidateFK
                )
            }

        }
    }
    
    public func existsOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws -> Bool {
        guard let foreignKeys = foreignKeys as? SerializableMapForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type \(String(describing: SerializableMapForeignKeys.self)) in \(#function) on type \(#file)"
            )
        }
        
        let allMaps = self.router.map { _, output in
            return output
        }
        
        for map in allMaps {
            if !(try map.existsOn(db: db, with: foreignKeys, propagate: propagate)) {
                return false
            }
        }
        
        #if DEBUG
        Self.logger.info("Maps router \(self.toString()) exists on db")
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
