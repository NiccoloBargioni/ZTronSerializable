import Foundation
import ZTronDataModel
import SQLite

public class SerializableGallerySearchTokenNode: SerializableNode {
    @Lowercased private var title: String
    @Lowercased private var icon: String
    @ColorHex private var iconColorHex: String
    
    public init(title: String, icon: String, iconColorHex: String) {
        self.title = title
        self.icon = icon
        self.iconColorHex = iconColorHex
    }
    
    public func writeTo(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys) throws {
        guard let foreignKeys = foreignKeys as? SerializableImageForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableImageForeignKeys in \(#function) on type \(#file)"
            )
        }
        
        try DBMS.CRUD.insertIntoGallerySearchToken(
            or: .ignore,
            for: db,
            title: self.title,
            icon: self.icon,
            iconColorHex: self.iconColorHex,
            game: foreignKeys.getGame(),
            map: foreignKeys.getMap(),
            tab: foreignKeys.getTab(),
            tool: foreignKeys.getTool(),
            gallery: foreignKeys.getGallery()
        )
    }
    
    public func existsOn(db: SQLite.Connection, with foreignKeys: SerializableForeignKeys, propagate: Bool) throws -> Bool {
        guard let foreignKeys = foreignKeys as? SerializableImageForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableImageForeignKeys in \(#function) on type \(#file)"
            )
        }

        return try DBMS.CRUD.gallerySearchTokenExists(
            for: db,
            game: foreignKeys.getGame(),
            map: foreignKeys.getMap(),
            tab: foreignKeys.getTab(),
            tool: foreignKeys.getTool(),
            gallery: foreignKeys.getGallery()
        )
    }
    
    public func toString() -> String {
        return """
            GALLERY_SEARCH_TOKEN(
                title: \(self.title),
                icon: \(self.icon),
                iconColorHex: \(self.iconColorHex)
            )
        """
    }
    
    public func getTitle() -> String {
        return self.title
    }
    
    public func getIcon() -> String {
        return self.icon
    }
    
    public func getIconColorHex() -> String {
        return self.iconColorHex
    }
}
