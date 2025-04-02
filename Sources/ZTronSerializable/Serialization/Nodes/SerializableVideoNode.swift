import Foundation
import SQLite
import ZTronDataModel

public class SerializableVideoNode: SerializableVisualMediaNode {
    private let name: String
    private let `extension`: String
    private let description: String
    private let position: Int
    private let searchLabel: String?

    public init(
        name: String,
        extension: String,
        description: String,
        position: Int,
        searchLabel: String? = nil
    ) {
        self.name = name
        self.extension = `extension`
        self.description = description
        self.position = position
        self.searchLabel = searchLabel
    }
    
    public func writeTo(db: Connection, with foreignKeys: any SerializableForeignKeys, shouldValidateFK: Bool = false) throws {
        guard let foreignKeys = foreignKeys as? SerializableImageForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableImageForeignKeys in \(#function) on type \(#file)"
            )
        }
        
        if shouldValidateFK {
            let firstInvalidFK = try foreignKeys.validate(on: db)
            
            if let firstInvalidFK = firstInvalidFK {
                throw SerializableException.invalidForeignKeyException(reason: firstInvalidFK)
            }
        }
                        
        try DBMS.CRUD.insertIntoVisualMedia(
            or: .ignore,
            for: db,
            type: .video,
            format: self.extension,
            name: self.name,
            description: self.description,
            position: self.position,
            searchLabel: self.searchLabel,
            game: foreignKeys.getGame(),
            map: foreignKeys.getMap(),
            tab: foreignKeys.getTab(),
            tool: foreignKeys.getTool(),
            gallery: foreignKeys.getGallery()
        )

    }
    
    public func existsOn(db: Connection, with foreignKeys: SerializableForeignKeys, propagate: Bool) throws -> Bool {
        guard let foreignKeys = foreignKeys as? SerializableImageForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableImageForeignKeys in \(#function) on type \(#file)"
            )
        }

        let videoExists = try DBMS.CRUD.videoExists(
            for: db,
            image: self.name,
            game: foreignKeys.getGame(),
            map: foreignKeys.getMap(),
            tab: foreignKeys.getTab(),
            tool: foreignKeys.getTool(),
            gallery: foreignKeys.getGallery()
        )
        
        return videoExists
    }
    
    public func getName() -> String {
        return self.name
    }
    
    public func getDescription() -> String {
        return self.description
    }
    
    public func getPosition() -> Int {
        return self.position
    }
    
    public func getExtension() -> String {
        return self.extension
    }
    
    public func getSearchLabel() -> String? {
        return self.searchLabel
    }
    
    public func toString() -> String {
        return """
            VIDEO(
                name: \(self.name),
                extension: \(self.extension),
                description: \(self.description),
                position: \(self.position),
                searchLabel: \(String(describing: self.searchLabel))
            )
        """
    }
}
