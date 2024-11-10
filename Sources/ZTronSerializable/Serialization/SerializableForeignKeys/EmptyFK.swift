import Foundation
import SQLite

public final class EmptyFK: SerializableForeignKeys {
    public init() {  }
    
    public func validate(on db: SQLite.Connection) throws -> ForeignKey? {
        return nil
    }
    
    public func toString() -> String {
        return "EMPTY_FK"
    }
    
}
