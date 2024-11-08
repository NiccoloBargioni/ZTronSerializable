import Foundation
import ZTronDataModel
import SQLite

/// Game → Map → Tab → Tool
///
/// Tab is redundant and uniqueness at 1.12.23 is guaranteed by the sequence
///
/// Game → Map  → Tool
public final class SerializableGalleryForeignKeys: SerializableForeignKeys {
    @Lowercased private var tool: String
    @Lowercased private var tab: String
    @Lowercased private var map: String
    @Lowercased private var game: String
    
    public init(tool: String, tab: String, map: String, game: String) {
        self.tool = tool
        self.tab = tab
        self.map = map
        self.game = game
    }
        
    public func getTool() -> String {
        return self.tool
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
    
    @discardableResult public func validate(on db: SQLite.Connection) throws -> ForeignKey? {
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
                
                if isTabFKValid {
                    var isToolFKValid: Bool = true
                    do {
                        isToolFKValid = try DBMS.CRUD.toolExists(for: db, tool: self.tool, tab: self.tab, map: self.map, game: self.game)
                    } catch {
                        throw SerializableException.invalidForeignKeyException(reason: .tool)
                    }
                    
                    return isToolFKValid ? nil : .tool
                } else {
                    return .tab
                }
            } else {
                return .map
            }
        } else {
            return .game
        }
    }

}
