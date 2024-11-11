import Foundation
import SQLite
import ZTronDataModel
import os

/// - `STUDIO(name, position, assetsImageName)`
/// - `PK(name)`
public final class SerializableStudioNode: SerializableNode {
    @Lowercased private var name: String
    private let position: Int
    private let assetsImageName: String
    private let games: [SerializableGameNode]
    private static let logger: os.Logger = .init(subsystem: "ZTronSerializable", category: "SerializableStudioNode")
    
    public init(name: String, position: Int, assetsImageName: String, games: [SerializableGameNode]) {
        self.name = name
        self.position = position
        self.assetsImageName = assetsImageName
        self.games = games
    }
    
    
    public func writeTo(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, shouldValidateFK: Bool) throws {
        guard let foreignKeys = foreignKeys as? ZTronSerializable.EmptyFK else {
            throw SerializableException.illegalArgumentException(
                reason: "Expected foreign keys of type \(String(describing: ZTronSerializable.EmptyFK.self)) in \(#function) @ \(#file) for game \(self.toString())"
            )
        }
        
        let positions = self.games.map { $0.getPosition() }
        
        if !Validator.validatePositions(positions) {
            throw SerializableException.illegalArgumentException(
                reason: "Unable to validate positions \(String(describing: positions)) for studio \(self.toString()) with foreign keys \(foreignKeys.toString())"
            )
        }

        try DBMS.CRUD.insertIntoStudio(
            or: .ignore,
            for: db,
            name: self.name,
            position: self.position,
            assetsImageName: self.assetsImageName
        )
        
        for game in self.games {
            try game.writeTo(
                db: db,
                with: SerializableGameForeignKeys(studio: self.name),
                shouldValidateFK: shouldValidateFK
            )
        }
    }
    
    public func existsOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws -> Bool {
        let studioExists = try DBMS.CRUD.studioExists(for: db, studio: self.name)
        
        #if DEBUG
        if studioExists {
            Self.logger.info("Studio \(self.toString()) exists on db")
        }
        #endif
        
        return studioExists
    }
    
    public func toString() -> String {
        return """
        STUDIO(
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
