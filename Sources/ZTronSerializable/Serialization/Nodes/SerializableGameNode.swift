import Foundation
import SQLite
import ZTronDataModel
import os

/// - `GAME(name, position, assetsImageName, studio)`
/// - `PK(name)`
/// - `FK(studio) REFERENCES STUDIO(name) ON DELETE CASCADE ON UPDATE CASCADE`
public final class SerializableGameNode: SerializableNode {
    @Lowercased private var name: String
    private let position: Int
    private let assetsImageName: String
    private let maps: SerializableMapsRouter
    private static let logger: os.Logger = .init(subsystem: "ZTronSerializable", category: "SerializableGameNode")
    
    public init(name: String, position: Int, assetsImageName: String, maps: SerializableMapsRouter) {
        self.name = name
        self.position = position
        self.assetsImageName = assetsImageName
        self.maps = maps
    }
    
    public func writeTo(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, shouldValidateFK: Bool) throws {
        guard let foreignKeys = foreignKeys as? SerializableGameForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "Expected foreign keys of type \(String(describing: SerializableGameForeignKeys.self)) in \(#function) @ \(#file) for game \(self.toString())"
            )
        }
        
        if shouldValidateFK {
            let firstInvalidFK = try foreignKeys.validate(on: db)
            
            if let firstInvalidFK = firstInvalidFK {
                throw SerializableException.invalidForeignKeyException(reason: firstInvalidFK)
            }
        }
        
        var mapsPositionsByDepth: [Int: [Int]] = [:]
        
        self.maps.router.forEach { absolutePath, output in
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
        
        try DBMS.CRUD.insertIntoGame(
            or: .ignore,
            for: db,
            name: self.name,
            position: self.position,
            assetsImageName: self.assetsImageName,
            studio: foreignKeys.getStudio()
        )

        try self.maps.writeTo(db: db, with: SerializableMapForeignKeys(game: self.name), shouldValidateFK: shouldValidateFK)
    }
    
    public func existsOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws -> Bool {
        guard let foreignKeys = foreignKeys as? SerializableGameForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "Expected foreign keys of type \(String(describing: SerializableGameForeignKeys.self)) in \(#function) @ \(#file) for game \(self.toString())"
            )
        }
        
        let gameExists = try DBMS.CRUD.gameExists(for: db, game: self.name)
        
        if gameExists {
            if propagate {
                let allMaps = self.maps.router.map {
                    return $1
                }
                
                for map in allMaps {
                    if !(try map.existsOn(
                        db: db,
                        with: SerializableMapForeignKeys(game: self.name),
                        propagate: propagate
                    )) {
                        return false
                    }
                }
                
                #if DEBUG
                Self.logger.info("Game \(self.toString()) with FK \(foreignKeys.toString()) exists on db")
                #endif
                return true
            } else {
                #if DEBUG
                Self.logger.info("Game \(self.toString()) with FK \(foreignKeys.toString()) exists on db")
                #endif
                return true
            }
        } else {
            return false
        }
    }
    
    public func toString() -> String {
        return """
        GAME(
            name: \(self.name),
            position: \(self.position),
            assetsImageName: \(assetsImageName)
        )
        """
    }
    
    public func getPosition() -> Int {
        return self.position
    }
}
