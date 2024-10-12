import Foundation
import SQLite
import ZTronDataModel

class SerializableImageVariantRelationshipNode: SerializableNode {
    private var master: String
    private var slave: String
    @Lowercased private var variant: String
    @Lowercased private var bottomBarIcon: String
    @NullableNormalizedRect private var boundingFrame: CGRect?
    
    init(master: String, slave: String, variant: String, bottomBarIcon: String, boundingFrame: CGRect? = nil) {
        self.master = master
        self.slave = slave
        self.variant = variant
        self.bottomBarIcon = bottomBarIcon
        self.boundingFrame = boundingFrame
    }
    
    public func writeTo(db: Connection, with foreignKeys: any SerializableForeignKeys) throws {
        guard let foreignKeys = foreignKeys as? SerializableImageForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableImageForeignKeys in \(#function) on type \(#file)"
            )
        }
                
        try DBMS.CRUD.insertIntoImageVariant(
            or: .ignore,
            for: db,
            master: self.master,
            slave: self.slave,
            variant: self.variant,
            bottomBarIcon: self.bottomBarIcon,
            boundingFrame: self.boundingFrame,
            game: foreignKeys.getGame(),
            map: foreignKeys.getMap(),
            tab: foreignKeys.getTab(),
            tool: foreignKeys.getTool(),
            gallery: foreignKeys.getGallery()
        )
    }

    func existsOn(db: SQLite.Connection, with foreignKeys: SerializableForeignKeys, propagate: Bool) throws -> Bool {
        guard let foreignKeys = foreignKeys as? SerializableImageForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableImageForeignKeys in \(#function) on type \(#file)"
            )
        }

        return try DBMS.CRUD.imageVariantRelationshipExists(
            for: db,
            master: self.master,
            slave: self.slave,
            game: foreignKeys.getGame(),
            map: foreignKeys.getMap(),
            tab: foreignKeys.getTab(),
            tool: foreignKeys.getTool(),
            gallery: foreignKeys.getGallery()
        )
    }
    
    public func getMaster() -> String {
        return self.master
    }
    
    public func getSlave() -> String {
        return self.slave
    }
    
    public func getVariant() -> String {
        return self.variant
    }
    
    public func getBottomBarIcon() -> String {
        return self.bottomBarIcon
    }
    
    public func getBoundingFrame() -> CGRect? {
        return self.boundingFrame
    }
    
    public func toString() -> String {
        return """
            IMAGE_VARIANT(
                master: \(self.master),
                slave: \(self.slave),
                variant: \(self.variant),
                bottomBarIcon: \(self.bottomBarIcon),
                boundingFrame: \(String(describing: self.boundingFrame))
            )
            """
    }
    
}
