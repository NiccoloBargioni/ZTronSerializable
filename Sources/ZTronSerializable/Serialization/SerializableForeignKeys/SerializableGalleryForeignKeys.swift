import Foundation

/// Game → Map → Tab → Tool
///
/// Tab is redundant and uniqueness at 1.12.23 is guaranteed by the sequence
///
/// Game → Map  → Tool
public class SerializableGalleryForeignKeys: SerializableForeignKeys {
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
}
