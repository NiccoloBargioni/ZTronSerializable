import Foundation
import SQLite
import ZTronDataModel
import ZTronRouter

public final class SerializableStudioRouter: SerializableNode {
    private let studios: ZTronRouter<Empty, SerializableStudioNode, Empty>
    
    public init(studios: ZTronRouter<Empty, SerializableStudioNode, Empty>) {
        self.studios = studios
    }

    public func writeTo(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, shouldValidateFK: Bool) throws {
        guard let foreignKeys = foreignKeys as? ZTronSerializable.EmptyFK else {
            throw SerializableException.illegalArgumentException(
                reason: "Expected foreign keys of type \(String(describing: ZTronSerializable.EmptyFK.self)) in \(#function) @ \(#file) for game \(self.toString())"
            )
        }

        
        var allPositions: [Int] = []
        
        do {
            allPositions = try self.studios.map { absolutePath, output in
                if absolutePath.count > 2 {
                    throw ValidateStudiosError.interruptSearch(reason: "Expected to have only one layer of studios, found one at depth \(absolutePath.count) with absolute path \(absolutePath) instead")
                }
                
                return output.getPosition()
            }
        } catch {
            throw SerializableException.validationException(reason: error.localizedDescription)
        }
        
        if !Validator.validatePositions(allPositions) {
            throw SerializableException.validationException(
                reason: "Unable to validate positions \(String(describing: allPositions)) for studios router \(self.toString()) with foreign keys \(foreignKeys.toString())"
            )
        }
        
        try self.studios.forEach { _, output in
            try output.writeTo(
                db: db,
                with: foreignKeys,
                shouldValidateFK: shouldValidateFK
            )
        }
    }
    
    
    public func existsOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws -> Bool {
        guard let foreignKeys = foreignKeys as? ZTronSerializable.EmptyFK else {
            throw SerializableException.illegalArgumentException(
                reason: "Expected foreign keys of type \(String(describing: ZTronSerializable.EmptyFK.self)) in \(#function) @ \(#file) for game \(self.toString())"
            )
        }

        let allStudios = self.studios.map { _, output in
            return output
        }
        
        for studio in allStudios {
            if !(try studio.existsOn(db: db, with: foreignKeys, propagate: propagate)) {
                return false
            }
        }
        
        return true
    }
    
    public func toString() -> String {
        return "ALL_STUDIOS"
    }
    
    
    public func deleteDanglingReferencesOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws {

        guard let _ = foreignKeys as? ZTronSerializable.EmptyFK else {
            throw SerializableException.illegalArgumentException(
                reason: "Expected foreign keys of type \(String(describing: ZTronSerializable.EmptyFK.self)) in \(#function) @ \(#file) for studio \(self.toString())"
            )
        }

        try self.studios.forEach { _, output in
            try output.deleteDanglingReferencesOn(db: db, with: foreignKeys, propagate: propagate)
        }
    }

    
    public func updateOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws {
        guard let _ = foreignKeys as? ZTronSerializable.EmptyFK else {
            throw SerializableException.illegalArgumentException(
                reason: "Expected foreign keys of type \(String(describing: ZTronSerializable.EmptyFK.self)) in \(#function) @ \(#file) for studio \(self.toString())"
            )
        }

        try self.studios.forEach { _, output in
            try output.updateOn(db: db, with: foreignKeys, propagate: propagate)
        }
    }

    
}


fileprivate enum ValidateStudiosError: Error {
    case interruptSearch(reason: String)
}
