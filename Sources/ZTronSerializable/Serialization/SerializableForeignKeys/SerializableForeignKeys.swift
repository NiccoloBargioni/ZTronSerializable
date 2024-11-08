import Foundation
import SQLite

/// Marker protocol class with default implementation for foreign keys sets
public protocol SerializableForeignKeys {
    /// Validates the foreign key on the specified databse connection.
    ///
    /// - Parameter db: The database to check against.
    /// - Returns: `nil` if the foreign keys are all valid, the first non-valid FK otherwise.
    @discardableResult func validate(on db: Connection) throws -> ForeignKey?
}
