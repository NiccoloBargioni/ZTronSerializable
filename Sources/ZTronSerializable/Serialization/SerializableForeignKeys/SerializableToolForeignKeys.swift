import Foundation
import ZTronDataModel
import SQLite

/// - `TOOL(name, position, assetsImageName, tab, map, game)`
/// - `PK(name, tab, map, game)`
/// - `FK(tab, map, game) REFERENCES TAB(name, map, game) ON DELETE CASCADE ON UPDATE CASCADE`
public final class SerializableToolForeignKeys: SerializableForeignKeys {
    @Lowercased private var tab: String
    @Lowercased private var map: String
    @Lowercased private var game: String
    
    public init(tab: String, map: String, game: String) {
        self.tab = tab
        self.map = map
        self.game = game
    }
        
    public func getTab() -> String {
        return self.tab
    }
    
    public func getMap() -> String {
        return self.map
    }
    
    public func getGame() -> String {
        return self.game
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
            
            if isMapFKValid {
                var isTabFKValid: Bool = true
                do {
                    isTabFKValid = try DBMS.CRUD.tabExists(for: db, tab: self.tab, map: self.map, game: self.game)
                } catch {
                    throw SerializableException.invalidForeignKeyException(reason: .tab)
                }
                
                return isTabFKValid ? nil : .tab
            } else {
                return .map
            }
        } else {
            return .game
        }
    }
}
