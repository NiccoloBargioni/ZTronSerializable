import Foundation
import SQLite
import ZTronDataModel

public class SerializableBoundingCircleNode: OverlaySerializableNode {
    @ColorHex private var colorHex: String
    private let _isActive: Bool
    @NormalizedReal private var opacity: Double
    @NullableNormalizedReal private var idleDiameter: Double?
    @NullableNormalizedPoint private var normalizedCenter: CGPoint?
    
    public init(
        colorHex: String = SerializableBoundingCircleNode.BoundingCircleDefaults.COLOR_HEX,
        isActive: Bool = SerializableBoundingCircleNode.BoundingCircleDefaults.IS_ACTIVE,
        opacity: Double = SerializableBoundingCircleNode.BoundingCircleDefaults.OPACITY,
        idleDiameter: Double? = nil,
        normalizedCenter: CGPoint? = nil
    ) {
        self.colorHex = colorHex
        self._isActive = isActive
        self.opacity = opacity
        self.idleDiameter = idleDiameter
        self.normalizedCenter = normalizedCenter
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

        
        try DBMS.CRUD.insertIntoBoundingCircle(
            or: .ignore,
            for: db,
            colorHex: self.colorHex,
            isActive: self._isActive,
            opacity: self.opacity,
            idleDiameter: self.idleDiameter,
            normalizedCenter: self.normalizedCenter,
            game: foreignKeys.getGame(),
            map: foreignKeys.getMap(),
            tab: foreignKeys.getTab(),
            tool: foreignKeys.getTool(),
            gallery: foreignKeys.getGallery(),
            image: foreignKeys.getImage()
        )
    }
    
    public func existsOn(db: SQLite.Connection, with foreignKeys: SerializableForeignKeys, propagate: Bool) throws -> Bool {
        guard let foreignKeys = foreignKeys as? SerializableImageOverlayForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableImageOverlayForeignKeys in \(#function) on type \(#file)"
            )
        }
        
        return try DBMS.CRUD.countBoundingCirclesForImage(
            for: db,
            game: foreignKeys.getGame(),
            map: foreignKeys.getMap(),
            tab: foreignKeys.getTab(),
            tool: foreignKeys.getTool(),
            gallery: foreignKeys.getGallery(),
            image: foreignKeys.getImage()
        ) == 1
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
    
    public func getIdleDiameter() -> Double? {
        return self.idleDiameter
    }
    
    public func getNormalizedCenter() -> CGPoint? {
        return self.normalizedCenter
    }
    
    public func toString() -> String {
        return """
            BOUNDING_CIRCLE(
                colorHex: \(self.colorHex),
                isActive: \(self._isActive),
                opacity: \(self.opacity),
                idleDiameter: \(String(describing: self.idleDiameter)),
                normalizedCenter: \(String(describing: self.normalizedCenter))
            )
        """
    }
    
    public struct BoundingCircleDefaults {
        public static let COLOR_HEX: String = SerializableOutlineNode.OutlineDefaults.COLOR_HEX
        public static let IS_ACTIVE: Bool = SerializableOutlineNode.OutlineDefaults.IS_ACTIVE
        public static let OPACITY: Double = SerializableOutlineNode.OutlineDefaults.OPACITY
    }
    
    /// - Note: Bounding Circle cannot have dangling references if you enter here. Deleting a bounding circle must happen at Visual Media level.
    public func deleteDanglingReferencesOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws {
        guard let _ = foreignKeys as? SerializableImageOverlayForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableImageOverlayForeignKeys in \(#function) on type \(#file)"
            )
        }
        
    }

    /// - Note: Bounding Circle cannot have dangling references if you enter here. Deleting a bounding circle must happen at Visual Media level.
    public func updateOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws {
        guard let _ = foreignKeys as? SerializableImageOverlayForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableImageOverlayForeignKeys in \(#function) on type \(#file)"
            )
        }
        
    }

}
