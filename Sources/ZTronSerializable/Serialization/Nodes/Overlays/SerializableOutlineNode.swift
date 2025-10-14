import Foundation
import SQLite
import ZTronDataModel

public class SerializableOutlineNode: OverlaySerializableNode {
    private let resourceName: String
    @ColorHex private var colorHex: String
    private let _isActive: Bool
    @NormalizedReal private var opacity: Double
    @NormalizedRect private var boundingBox: CGRect

    public init(
        resourceName: String,
        colorHex: String = OutlineDefaults.COLOR_HEX,
        isActive: Bool = OutlineDefaults.IS_ACTIVE,
        opacity: Double = OutlineDefaults.OPACITY,
        boundingBox: CGRect
    ) {
        self.colorHex = colorHex
        self._isActive = isActive
        self.opacity = opacity
        self.boundingBox = boundingBox
        self.resourceName = resourceName
    }
    
    public func writeTo(db: Connection, with foreignKeys: any SerializableForeignKeys, shouldValidateFK: Bool = false) throws {
        guard let foreignKeys = foreignKeys as? SerializableImageOverlayForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableImageOverlayForeignKeys in \(#function) on type \(#file)"
            )
        }
        
        if shouldValidateFK {
            let firstInvalidFK = try foreignKeys.validate(on: db)
            
            if let firstInvalidFK = firstInvalidFK {
                throw SerializableException.invalidForeignKeyException(reason: firstInvalidFK)
            }
        }
        
        try DBMS.CRUD.insertIntoOutline(
            or: .ignore,
            for: db,
            resourceName: self.resourceName,
            colorHex: self.colorHex,
            isActive: self._isActive,
            opacity: self.opacity,
            boundingBox: self.boundingBox,
            game: foreignKeys.getGame(),
            map: foreignKeys.getMap(),
            tab: foreignKeys.getTab(),
            tool: foreignKeys.getTool(),
            gallery: foreignKeys.getGallery(),
            image: foreignKeys.getImage()
        )
    }
    
    public func existsOn(db: Connection, with foreignKeys: SerializableForeignKeys, propagate: Bool) throws -> Bool {
        guard let foreignKeys = foreignKeys as? SerializableImageOverlayForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableImageOverlayForeignKeys in \(#function) on type \(#file)"
            )
        }

        return try DBMS.CRUD.countOutlinesForImage(
            for: db,
            game: foreignKeys.getGame(),
            map: foreignKeys.getMap(),
            tab: foreignKeys.getTab(),
            tool: foreignKeys.getTool(),
            gallery: foreignKeys.getGallery(),
            image: foreignKeys.getImage()
        ) == 1
    }
    
    public func toString() -> String {
        return """
            OUTLINE(
                colorHex: \(self.colorHex),
                isActive: \(self._isActive),
                opacity: \(self.opacity),
                boundingBox: \(self.boundingBox)
            )
        """
    }
    
    public func getColorHex() -> String {
        return self.colorHex
    }
    
    public func isActive() -> Bool {
        return self._isActive
    }
    
    public func getOpacity() -> Double {
        return self.opacity
    }
    
    public func getBoundingBox() -> CGRect {
        return self.boundingBox
    }
    
    public func getResourceName() -> String {
        return self.resourceName
    }
    
    public struct OutlineDefaults {
        public static let IS_ACTIVE: Bool = true
        public static let OPACITY: Double = 1.0
        public static let COLOR_HEX: String = "#A2C9FF"
    }
    
    /// - Note: Outline cannot have dangling references if you enter here. Deleting a bounding circle must happen at Visual Media level.
    public func deleteDanglingReferencesOn(db: Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws {
        
    }
    
    
    /// - Note: Outline cannot have dangling references if you enter here. Deleting a bounding circle must happen at Visual Media level.
    public func updateOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws {
        guard let foreignKeys = foreignKeys as? SerializableImageOverlayForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableImageOverlayForeignKeys in \(#function) on type \(#file)"
            )
        }
        
    }

}
