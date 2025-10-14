import Foundation
import SQLite
import ZTronDataModel

public class SerializableImageNode: SerializableVisualMediaNode {
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
    
    public func writeTo(db: Connection, with foreignKeys: any SerializableForeignKeys, shouldValidateFK: Bool = false) throws {
        guard let foreignKeys = foreignKeys as? SerializableImageForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableImageForeignKeys in \(#function) on type \(#file)"
            )
        }
        
        if shouldValidateFK {
            let firstInvalidFK = try foreignKeys.validate(on: db)
            
            if let firstInvalidFK = firstInvalidFK {
                throw SerializableException.invalidForeignKeyException(reason: firstInvalidFK)
            }
        }
                        
        try DBMS.CRUD.insertIntoVisualMedia(
            or: .ignore,
            for: db,
            type: .image,
            format: nil,
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
                ),
                shouldValidateFK: shouldValidateFK
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
    
    /// This implementation removes dangling outlines and bounding circles if any.
    public func deleteDanglingReferencesOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws {
        guard let foreignKeys = foreignKeys as? SerializableImageForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableImageForeignKeys in \(#function) on type \(#file)"
            )
        }

        let boundingCircles = self.overlays.compactMap { overlayNode in
            return overlayNode as? SerializableBoundingCircleNode
        }
        
        if boundingCircles.count <= 0 {
            try DBMS.CRUD.deleteBoundingCircleForImage(
                for: db,
                image: self.name,
                gallery: foreignKeys.getGallery(),
                tool: foreignKeys.getTool(),
                tab: foreignKeys.getTab(),
                map: foreignKeys.getMap(),
                game: foreignKeys.getGame()
            )
        }
        
        let outlines = self.overlays.compactMap { overlayNode in
            return overlayNode as? SerializableOutlineNode
        }
        
        if outlines.count <= 0 {
           try DBMS.CRUD.deleteOutlineForImage(
               for: db,
               image: self.name,
               gallery: foreignKeys.getGallery(),
               tool: foreignKeys.getTool(),
               tab: foreignKeys.getTab(),
               map: foreignKeys.getMap(),
               game: foreignKeys.getGame()
           )
       }
    }

    public func updateOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws {
        guard let foreignKeys = foreignKeys as? SerializableImageForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableImageForeignKeys in \(#function) on type \(#file)"
            )
        }
        
        try self.overlays.compactMap { overlay in
            return overlay as? SerializableBoundingCircleNode
        }.forEach { boundingCircleNode in
            try DBMS.CRUD.updateBoundingCirclesForImage(
                for: db,
                image: self.name,
                gallery: foreignKeys.getGallery(),
                tool: foreignKeys.getTool(),
                tab: foreignKeys.getTab(),
                map: foreignKeys.getMap(),
                game: foreignKeys.getGame()
            ) { draft in
                draft
                   .withIdleDiameter(boundingCircleNode.getIdleDiameter())
                   .withNormalizedCenter(boundingCircleNode.getNormalizedCenter())
            } validate: { boundingCircles in
                return boundingCircles.reduce(true) { isSetValid, boundingCircle in
                    let diameter = boundingCircle.getIdleDiameter() ?? 0
                    let normalizedCenter = boundingCircle.getNormalizedCenter()
                    let opacity: Double = boundingCircle.getOpacity()
                    let color: String = boundingCircle.getColorHex()
                    
                    return isSetValid &&
                            (diameter >= 0 && diameter <= 1) &&
                                (normalizedCenter?.x ?? 0 >= 0 && normalizedCenter?.x ?? 0 <= 1) &&
                                (normalizedCenter?.y ?? 0 >= 0 && normalizedCenter?.y ?? 0 <= 1) &&
                                opacity >= 0 && opacity <= 1 &&
                                isValidHexColor(color)
                }
            }
        }
        
        
        try self.overlays.compactMap { overlay in
            return overlay as? SerializableOutlineNode
        }.forEach { outlineNode in
            
            try DBMS.CRUD.updateOutlinesForImage(
                for: db,
                image: self.name,
                gallery: foreignKeys.getGallery(),
                tool: foreignKeys.getTool(),
                tab: foreignKeys.getTab(),
                map: foreignKeys.getMap(),
                game: foreignKeys.getGame()
            ) { draft in
                draft
                    .withResourceName(outlineNode.getResourceName())
                    .withBoundingBox(outlineNode.getBoundingBox())
            } validate: { outlines in
                return outlines.reduce(true) { isSetValid, outline in
                    let boundingBox = outline.getBoundingBox()
                    let opacity: Double = outline.getOpacity()
                    let color: String = outline.getColorHex()
                    
                    return isSetValid &&
                            (boundingBox.origin.x >= 0 && boundingBox.origin.x <= 1) &&
                            (boundingBox.origin.y >= 0 && boundingBox.origin.y <= 1) &&
                            (boundingBox.size.width >= 0 && boundingBox.size.width <= 1) &&
                            (boundingBox.size.height >= 0 && boundingBox.size.height <= 1) &&
                            opacity >= 0 && opacity <= 1 && isValidHexColor(color)
                }
            }
        }
        
        if propagate {
            try self.overlays.forEach { overlayNode in
                try overlayNode.updateOn(db: db, with: SerializableImageOverlayForeignKeys(image: self.name, imageFK: foreignKeys), propagate: propagate)
            }
        }
    }

}
