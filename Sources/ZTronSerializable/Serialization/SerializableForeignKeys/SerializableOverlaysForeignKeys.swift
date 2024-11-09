import Foundation
import ZTronDataModel
import SQLite

/// Game → Map → Tab → Tool → Gallery → Image
///
/// Tab is redundant as for 1.12.23 and uniqueness is guaranteed by
///
/// Game → Map → Tool → Gallery → Image
public final class SerializableImageOverlayForeignKeys: SerializableForeignKeys {
    private var image: String
    @Lowercased private var gallery: String
    @Lowercased private var tool: String
    @Lowercased private var tab: String
    @Lowercased private var map: String
    @Lowercased private var game: String
    
    public init(image: String, gallery: String, tool: String, tab: String, map: String, game: String) {
        self.image = image
        self.gallery = gallery
        self.tool = tool
        self.tab = tab
        self.map = map
        self.game = game
    }
    
    public convenience init(image: String, imageFK: SerializableImageForeignKeys) {
        self.init(
            image: image,
            gallery: imageFK.getGallery(),
            tool: imageFK.getTool(),
            tab: imageFK.getTab(),
            map: imageFK.getMap(),
            game: imageFK.getGame()
        )
    }
    
    public func getImage() -> String {
        return self.image
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
                        
                        if isGalleryValid {
                            var isImageValid: Bool = true
                            do {
                                isImageValid = try DBMS.CRUD.imageExists(for: db, image: self.image, game: self.game, map: self.map, tab: self.tab, tool: self.tool, gallery: self.gallery)
                            }
                            
                            return isImageValid ? nil : .image
                        } else {
                            return .gallery
                        }
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
            IMAGE_OVERLAY_FK(
                image: \(self.image),
                gallery: \(self.gallery),
                tool: \(self.tool),
                tab: \(self.tab),
                map: \(self.map),
                game: \(self.game)
            )
        """
    }

}
