import Foundation
import SQLite

/// Protocol for nodes that can be written to database
public protocol SerializableNode: Loggable {
    /// - Usually consists in the following steps:
    /// - Check that the foreignKeys parameter is of appropriate type.
    /// - Validate the foreign keys if `shouldValidateFK == true`.
    /// - Run validator on the node, if applicable. If validation fails, the method throws `SerializableException.invalidForeignKeyException(let reason: String)`.
    /// - Write the validated node on the db
    ///
    /// - Important: The persistance on the database is propagated recursively to all the serializable elements of this instance of `SerializableNode`.
    /// - Important: The conflict resolution strategy on insertion is IGNORE.
    func writeTo(db: Connection, with foreignKeys: any SerializableForeignKeys, shouldValidateFK: Bool) throws
    
    
    func existsOn(db: Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws -> Bool
    
    
    func deleteDanglingReferencesOn(db: Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws 
}

extension SerializableNode {
    public func writeIfNotExists(db: Connection, with foreignKeys: any SerializableForeignKeys, shouldValidateFK: Bool = false, propagate: Bool) throws {
        if !(try self.existsOn(db: db, with: foreignKeys, propagate: propagate)) {
            try self.writeTo(db: db, with: foreignKeys, shouldValidateFK: shouldValidateFK)
        }
    }
}
