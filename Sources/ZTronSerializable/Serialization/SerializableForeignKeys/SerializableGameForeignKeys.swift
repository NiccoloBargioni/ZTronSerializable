import Foundation
import SQLite
import ZTronDataModel

/// - `GAME(name, position, assetsImageName, studio)`
/// - `PK(name)`
/// - `FK(studio) REFERENCES STUDIO(name) ON DELETE CASCADE ON UPDATE CASCADE`
public final class SerializableGameForeignKeys: SerializableForeignKeys {
    @Lowercased private var studio: String
    
    public init(studio: String) {
        self.studio = studio
    }
    
    public func validate(on db: SQLite.Connection) throws -> ForeignKey? {
        return try DBMS.CRUD.studioExists(for: db, studio: self.studio) ? nil : .studio
    }
    
    public func toString() -> String {
        return "GAME_FK(studio: \(self.studio))"
    }
    
    public func getStudio() -> String {
        return self.studio
    }
}
