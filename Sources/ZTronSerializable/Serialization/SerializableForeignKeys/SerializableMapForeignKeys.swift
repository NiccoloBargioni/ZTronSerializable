import Foundation
import SQLite
import ZTronDataModel

/// - `MAP(name, position, assetsImageName, game)`
/// - `PK(name, game)`
/// - `FK(game) REFERENCES GAME(name) ON DELETE CASCADE ON UPDATE CASCADE`
public final class SerializableMapForeignKeys: SerializableForeignKeys {
    @Lowercased private var game: String

    public init(game: String) {
        self.game = game
    }
    
    public func validate(on db: SQLite.Connection) throws -> ForeignKey? {
        return try DBMS.CRUD.gameExists(for: db, game: self.game) ? nil : .game
    }
    
    public func toString() -> String {
        return """
        MAP_FK(
            game: \(self.game)
        )
        """
    }
    
    public func getGame() -> String {
        return self.game
    }
}
