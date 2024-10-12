import Foundation
import SQLite
import ZTronRouter

public class SerializableGalleryRouter: SerializableNode {
    
    internal var router: ZTronRouter<Empty, SerializableGalleryNode, Empty>
    
    init() {
        self.router = ZTronRouter()
    }
    
    public func writeTo(db: Connection, with foreignKeys: SerializableForeignKeys) throws {
        guard let foreignKeys = foreignKeys as? SerializableGalleryForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableGalleryForeignKeys in \(#function) on type \(#file)"
            )
        }
        
        #if DEBUG
        if !Validator.validateGalleryRouter(self.router, validateImages: false) {
            throw SerializableException.validationException(reason: "Couldn't validate images for me")
        }
        #endif
        
        try self.router.forEach { absolutePath, output in
            try output.writeTo(db: db, with: foreignKeys)
            
            if absolutePath.count > 2 {
                let master = absolutePath[absolutePath.count-2]
                let slave = output.getName()
                
                try SerializableSubgalleryRelationshipNode(master: master, slave: slave).writeTo(db: db, with: foreignKeys)
            }

        }
    }
    
    public func existsOn(db: SQLite.Connection, with foreignKeys: SerializableForeignKeys, propagate: Bool) throws -> Bool {
        guard let foreignKeys = foreignKeys as? SerializableGalleryForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableGalleryForeignKeys in \(#function) on type \(#file)"
            )
        }

        do {
            try self.router.forEach { absolutePath, galleryNode in
                
                if !(try galleryNode.existsOn(db: db, with: foreignKeys, propagate: propagate)) {
                    throw ExistanceError.interruptSearchError(
                        reason: "Gallery \(galleryNode.getName()) (or parts of it) does not exist on db"
                    )
                } else {
                    print("Gallery \(galleryNode.getName()) exists on DB")
                }
                
                if absolutePath.count > 2 {
                    let master = absolutePath[absolutePath.count-2]
                    let slave = galleryNode.getName()
                    
                    let relationshipNode = SerializableSubgalleryRelationshipNode(
                        master: master, slave: slave
                    )
                    
                    if !(try relationshipNode.existsOn(db: db, with: foreignKeys, propagate: propagate)) {
                        throw ExistanceError.interruptSearchError(
                            reason: "\(master) -> \(slave) relationship between galleries doesn't exist on db"
                        )
                    }
                }
            }
        } catch ExistanceError.interruptSearchError(let reason) {
            print(reason)
            return false
        }
        
        return true
    }
    
    
    public func toString() -> String {
        return self.router.map { _, output in
            return output.toString()
        }.joined(separator: "\n")
    }
    
}

fileprivate enum ExistanceError: Error {
    case interruptSearchError(reason: String)
}
