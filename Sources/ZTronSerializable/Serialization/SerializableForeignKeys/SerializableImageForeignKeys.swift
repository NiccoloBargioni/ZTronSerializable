import Foundation

/// Game → Map → Tab → Tool → Gallery
///
/// Tab is redundant as for 1.12.23 and uniqueness is guaranteed by
///
/// Game → Map → Tool → Gallery
public class SerializableImageForeignKeys: SerializableForeignKeys {
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
    
}
