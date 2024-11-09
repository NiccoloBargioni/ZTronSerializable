import Foundation
import ZTronDataModel
import SQLite

/// - `TAB(name, position, iconName, map, game)`
/// - `PK(name, map, game)`
/// - `FK(map, game) REFERENCES MAP(name, game) ON DELETE CASCADE ON UPDATE CASCADE`
public final class SerializableTabForeignKeys: SerializableForeignKeys {
    @Lowercased private var map: String
    @Lowercased private var game: String
    
    init(name: String, position: Int, iconName: String, map: String, game: String) {
        self.map = map
        self.game = game
    }
    
    public func validate(on db: SQLite.Connection) throws -> ForeignKey? {
        var isGameFKValid: Bool = true
        
        do {
            isGameFKValid = try DBMS.CRUD.gameExists(for: db, game: self.game)
        } catch {
            throw SerializableException.invalidForeignKeyException(reason: .game)
        }
        
        if isGameFKValid {
            var isMapFKValid: Bool = true
            do {
                isMapFKValid = try DBMS.CRUD.mapExists(for: db, map: self.map, game: self.game)
            } catch {
                throw SerializableException.invalidForeignKeyException(reason: .map)
            }
            
            return isMapFKValid ? nil : .map
        } else {
            return .game
        }
    }
    
    public func getMap() -> String {
        return self.map
    }
    
    public func getGame() -> String {
        return self.game
    }
}
