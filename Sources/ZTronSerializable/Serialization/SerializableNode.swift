import Foundation
import SQLite

/// Protocol for nodes that can be written to database
public protocol SerializableNode: Loggable {
    func writeTo(db: Connection, with foreignKeys: any SerializableForeignKeys, shouldValidateFK: Bool) throws
    func existsOn(db: Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws -> Bool
}

extension SerializableNode {
    public func writeIfNotExists(db: Connection, with foreignKeys: any SerializableForeignKeys, shouldValidateFK: Bool = false, propagate: Bool) throws {
        if !(try self.existsOn(db: db, with: foreignKeys, propagate: propagate)) {
            print("\(#function) writing model to db")
            try self.writeTo(db: db, with: foreignKeys, shouldValidateFK: shouldValidateFK)
        }
    }
}
