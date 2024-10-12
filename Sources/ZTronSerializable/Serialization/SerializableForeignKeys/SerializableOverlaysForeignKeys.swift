import Foundation

/// Game → Map → Tab → Tool → Gallery → Image
///
/// Tab is redundant as for 1.12.23 and uniqueness is guaranteed by
///
/// Game → Map → Tool → Gallery → Image
public class SerializableImageOverlayForeignKeys: SerializableForeignKeys {
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
}
