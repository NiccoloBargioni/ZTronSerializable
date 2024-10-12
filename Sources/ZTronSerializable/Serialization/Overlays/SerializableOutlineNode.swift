import Foundation
import SQLite
import ZTronDataModel

public class SerializableOutlineNode: OverlaySerializableNode {
    @ColorHex private var colorHex: String
    private let _isActive: Bool
    @NormalizedReal private var opacity: Double
    @NormalizedRect private var boundingBox: CGRect

    public init(
        colorHex: String = OutlineDefaults.COLOR_HEX,
        isActive: Bool = OutlineDefaults.IS_ACTIVE,
        opacity: Double = OutlineDefaults.OPACITY,
        boundingBox: CGRect
    ) {
        self.colorHex = colorHex
        self._isActive = isActive
        self.opacity = opacity
        self.boundingBox = boundingBox
    }
    
    public func writeTo(db: Connection, with foreignKeys: any SerializableForeignKeys) throws {
        guard let foreignKeys = foreignKeys as? SerializableImageOverlayForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableImageOverlayForeignKeys in \(#function) on type \(#file)"
            )
        }
        
        try DBMS.CRUD.insertIntoOutline(
            or: .ignore,
            for: db,
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
    
    public struct OutlineDefaults {
        public static let IS_ACTIVE: Bool = true
        public static let OPACITY: Double = 1.0
        public static let COLOR_HEX: String = "#A2C9FF"
    }
}
