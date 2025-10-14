import Foundation
import SQLite
import ZTronDataModel

/*
public class SerializableLabelNode: OverlaySerializableNode {
    private let label: String
    private let _isActive: Bool
    @NullableLowercased private var icon: String?
    private let assetsImageName: String?
    @ColorHex private var textColorHex: String
    @ColorHex private var backgroundColorHex: String
    @NormalizedReal private var opacity: Double
    @NullableNormalizedRect private var maxAABB: CGRect?
    
    public init(
        label: String,
        isActive: Bool = SerializableLabelNode.LabelDefaults.IS_ACTIVE,
        icon: String? = SerializableLabelNode.LabelDefaults.ICON,
        assetsImageName: String? = SerializableLabelNode.LabelDefaults.ASSETS_IMAGE_NAME,
        textColorHex: String = SerializableLabelNode.LabelDefaults.TEXT_COLOR_HEX,
        backgroundColorHex: String = SerializableLabelNode.LabelDefaults.BACKGROUND_COLOR_HEX,
        opacity: Double = SerializableLabelNode.LabelDefaults.OPACITY,
        maxAABB: CGRect? = SerializableLabelNode.LabelDefaults.MAX_AABB
    ) {
        self.label = label
        self._isActive = isActive
        self.icon = icon
        self.assetsImageName = assetsImageName
        self.textColorHex = textColorHex
        self.backgroundColorHex = backgroundColorHex
        self.opacity = opacity
        self.maxAABB = maxAABB
    }
    
    public func writeTo(db: Connection, with foreignKeys: any SerializableForeignKeys, shouldValidateFK: Bool = true) throws {
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
        
        try DBMS.CRUD.insertIntoLabel(
            or: .ignore,
            for: db,
            label: self.label,
            isActive: self._isActive,
            icon: self.icon,
            assetsImageName: self.assetsImageName,
            textColorHex: self.textColorHex,
            backgroundColorHex: self.backgroundColorHex,
            opacity: self.opacity,
            maxAABB: self.maxAABB,
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

        return try DBMS.CRUD.labelExists(
            for: db,
            label: self.label,
            game: foreignKeys.getGame(),
            map: foreignKeys.getMap(),
            tab: foreignKeys.getTab(),
            tool: foreignKeys.getTool(),
            gallery: foreignKeys.getGallery(),
            image: foreignKeys.getImage()
        )
    }
    
    public func getLabel() -> String {
        return self.label
    }
    
    public func isActive() -> Bool {
        return self._isActive
    }
    
    public func getIcon() -> String? {
        return self.icon
    }
    
    public func getAssetsImageName() -> String? {
        return self.assetsImageName
    }
    
    public func getTextColorHex() -> String {
        return self.textColorHex
    }
    
    public func getBackgroundColorHex() -> String {
        return self.backgroundColorHex
    }
    
    public func getOpacity() -> Double {
        return self.opacity
    }
    
    public func getMaxAABB() -> CGRect? {
        return self.maxAABB
    }
    
    public func toString() -> String {
        return """
            Label(
                label: \(self.label),
                isActive: \(self._isActive),
                icon: \(String(describing: self.icon)),
                assetsImageName: \(String(describing: self.assetsImageName)),
                textColorHex: \(self.textColorHex),
                backgroundColorHex: \(self.backgroundColorHex),
                opacity: \(self.opacity),
                maxAABB: \(String(describing: self.maxAABB))
            )
        """
    }
    
    public struct LabelDefaults {
        public static let IS_ACTIVE: Bool = true
        public static let ICON: String? = nil
        public static let ASSETS_IMAGE_NAME: String? = nil
        public static let TEXT_COLOR_HEX: String = "#FFFFFF"
        public static let BACKGROUND_COLOR_HEX: String = "#000000"
        public static let OPACITY: Double = 0.75
        public static let MAX_AABB: CGRect? = nil
    }
}*/
