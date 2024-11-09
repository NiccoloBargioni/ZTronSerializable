import Foundation
import ZTronDataModel
import SQLite

/// Game → Map → Tab → Tool → Gallery
///
/// Tab is redundant as for 1.12.23 and uniqueness is guaranteed by
///
/// Game → Map → Tool → Gallery
public final class SerializableImageForeignKeys: SerializableForeignKeys {
    @Lowercased private var gallery: String
    @Lowercased private var tool: String
    @Lowercased private var tab: String
    @Lowercased private var map: String
    @Lowercased private var game: String
    
    public init(gallery: String, tool: String, tab: String, map: String, game: String) {
        self.gallery = gallery
        self.tool = tool
        self.tab = tab
        self.map = map
        self.game = game
    }
    
    public convenience init(gallery: String, galleryFK: SerializableGalleryForeignKeys) {
        self.init(
            gallery: gallery,
            tool: galleryFK.getTool(),
            tab: galleryFK.getTab(),
            map: galleryFK.getMap(),
            game: galleryFK.getGame()
        )
    }
    
    public func getGallery() -> String {
        return self.gallery
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
                
                if isTabFKValid {
                    var isToolFKValid: Bool = true
                    do {
                        isToolFKValid = try DBMS.CRUD.toolExists(for: db, tool: self.tool, tab: self.tab, map: self.map, game: self.game)
                    } catch {
                        throw SerializableException.invalidForeignKeyException(reason: .tool)
                    }
                    
                    if isToolFKValid {
                        var isGalleryValid: Bool = true
                        do {
                            isGalleryValid = try DBMS.CRUD.galleryExists(for: db, gallery: self.gallery, game: self.game, map: self.map, tab: self.tab, tool: self.tool)
                        } catch {
                            throw SerializableException.invalidForeignKeyException(reason: .gallery)
                        }
                        
                        return isGalleryValid ? nil : .gallery
                    } else {
                        return .tool
                    }
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
    
    public func toString() -> String {
        return """
            IMAGE_FK(
                gallery: \(self.gallery),
                tool: \(self.tool),
                tab: \(self.tab),
                map: \(self.map),
                game: \(self.game)
            )
        """
    }

}
