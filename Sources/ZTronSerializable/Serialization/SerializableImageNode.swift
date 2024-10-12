import Foundation
import SQLite
import ZTronDataModel

public class SerializableImageNode: SerializableNode {
    private let name: String
    private let description: String
    private let position: Int
    private let searchLabel: String?
    internal let overlays: [any OverlaySerializableNode]

    public init(
        name: String,
        description: String,
        position: Int,
        searchLabel: String? = nil,
        overlays: [any OverlaySerializableNode] = []
    ) {
        self.name = name
        self.description = description
        self.position = position
        self.searchLabel = searchLabel
        self.overlays = overlays
    }
    
    public func writeTo(db: Connection, with foreignKeys: any SerializableForeignKeys) throws {
        guard let foreignKeys = foreignKeys as? SerializableImageForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableImageForeignKeys in \(#function) on type \(#file)"
            )
        }
                        
        try DBMS.CRUD.insertIntoImage(
            or: .ignore,
            for: db,
            name: self.name,
            description: self.description,
            position: self.position,
            searchLabel: self.searchLabel,
            game: foreignKeys.getGame(),
            map: foreignKeys.getMap(),
            tab: foreignKeys.getTab(),
            tool: foreignKeys.getTool(),
            gallery: foreignKeys.getGallery()
        )
        
        try self.overlays.forEach { overlayNode in
            try overlayNode.writeTo(
                db: db,
                with: SerializableImageOverlayForeignKeys(
                    image: self.name,
                    imageFK: foreignKeys
                )
            )
        }
    }
    
    public func existsOn(db: Connection, with foreignKeys: SerializableForeignKeys, propagate: Bool) throws -> Bool {
        guard let foreignKeys = foreignKeys as? SerializableImageForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableImageForeignKeys in \(#function) on type \(#file)"
            )
        }

        let imageExists = try DBMS.CRUD.imageExists(
            for: db,
            image: self.name,
            game: foreignKeys.getGame(),
            map: foreignKeys.getMap(),
            tab: foreignKeys.getTab(),
            tool: foreignKeys.getTool(),
            gallery: foreignKeys.getGallery()
        )
        
        if !propagate {
            return imageExists
        } else {
            if !imageExists {
                return false
            } else {
                for overlay in self.overlays {
                    if !(try overlay.existsOn(
                        db: db,
                        with: SerializableImageOverlayForeignKeys(
                            image: self.name,
                            imageFK: foreignKeys
                        ),
                        propagate: true
                    )) {
                        return false
                    }
                }
                
                return true
            }
        }
    }
    
    public func getName() -> String {
        return self.name
    }
    
    public func getDescription() -> String {
        return self.description
    }
    
    public func getPosition() -> Int {
        return self.position
    }
    
    public func getSearchLabel() -> String? {
        return self.searchLabel
    }
    
    public func toString() -> String {
        return """
            IMAGE(
                name: \(self.name),
                description: \(self.description),
                position: \(self.position),
                searchLabel: \(String(describing: self.searchLabel))
            )
        """
    }
}
