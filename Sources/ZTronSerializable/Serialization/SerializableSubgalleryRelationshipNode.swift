import Foundation
import SQLite
import ZTronDataModel

public class SerializableSubgalleryRelationshipNode: SerializableNode {
    @Lowercased private var master: String
    @Lowercased private var slave: String
    
    init(master: String, slave: String) {
        self.master = master
        self.slave = slave
    }
    
    public func writeTo(db: Connection, with foreignKeys: any SerializableForeignKeys) throws {
        guard let foreignKeys = foreignKeys as? SerializableGalleryForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableGalleryForeignKeys in \(#function) on type \(#file)"
            )
        }
        
        try DBMS.CRUD.insertIntoHasSubgallery(
            or: .ignore,
            for: db,
            master: self.master,
            slave: self.slave,
            game: foreignKeys.getGame(),
            map: foreignKeys.getMap(),
            tab: foreignKeys.getTab(),
            tool: foreignKeys.getTool()
        )
    }

    public func existsOn(db: SQLite.Connection, with foreignKeys: SerializableForeignKeys, propagate: Bool) throws -> Bool {
        guard let foreignKeys = foreignKeys as? SerializableGalleryForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableGalleryForeignKeys in \(#function) on type \(#file)"
            )
        }

        return try DBMS.CRUD.subgalleryRelationshipExists(
            for: db,
            master: self.master,
            slave: self.slave,
            game: foreignKeys.getGame(),
            map: foreignKeys.getMap(),
            tab: foreignKeys.getTab(),
            tool: foreignKeys.getTool()
        )
    }
     
    public func getMaster() -> String {
        return self.master
    }
    
    public func getSlave() -> String {
        return self.slave
    }
    
    
    public func toString() -> String {
        return """
            HAS_SUBGALLERY(
                master: \(self.master),
                slave: \(self.slave)
            )
            """
    }
    
}
