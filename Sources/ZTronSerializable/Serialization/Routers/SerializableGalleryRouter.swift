import Foundation
import SQLite
import ZTronRouter
import os

public class SerializableGalleryRouter: SerializableNode {
    private static let logger: os.Logger = .init(subsystem: "ZTronSerializable", category: "SerializableGalleryRouter")
    public let router: ZTronRouter<Empty, SerializableGalleryNode, Empty>
    
    init() {
        self.router = ZTronRouter()
    }
    
    public func writeTo(db: Connection, with foreignKeys: SerializableForeignKeys, shouldValidateFK: Bool = false) throws {
        guard let foreignKeys = foreignKeys as? SerializableGalleryForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableGalleryForeignKeys in \(#function) on type \(#file)"
            )
        }
        
        if shouldValidateFK {
            let firstInvalidFK = try foreignKeys.validate(on: db)
            
            if let firstInvalidFK = firstInvalidFK {
                throw SerializableException.invalidForeignKeyException(reason: firstInvalidFK)
            }
        }

        #if DEBUG
        if !Validator.validateGalleryRouter(self.router, validateImages: false) {
            throw SerializableException.validationException(reason: "Couldn't validate images for me")
        }
        #endif
        
        try self.router.forEach { absolutePath, output in
            try output.writeTo(db: db, with: foreignKeys, shouldValidateFK: shouldValidateFK)
            
            if absolutePath.count > 2 {
                guard let master = self.router.peek(at: Array.array(subsequence: absolutePath.prefix(upTo: absolutePath.count - 1))) else {
                    fatalError("Gaps not allowed in \(String(describing: Self.self)) for \(self.toString())")
                }
                let slave = output.getName()
                
                try SerializableSubgalleryRelationshipNode(master: master.getName(), slave: slave).writeTo(db: db, with: foreignKeys, shouldValidateFK: shouldValidateFK)
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
                    #if DEBUG
                    Self.logger.log(level: .info, "Gallery \(galleryNode.getName()) exists on DB")
                    #endif
                }
                
                if absolutePath.count > 2 {
                    guard let master = self.router.peek(
                        at: Array.array(subsequence: absolutePath.prefix(upTo: absolutePath.count - 1))
                    )?.getName() else {
                        fatalError("No gaps allowed in \(String(describing: Self.self)) for \(self.toString())")
                    }
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
            #if DEBUG
            Self.logger.error("\(reason)")
            #endif
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
