import Foundation
import SQLite
import ZTronDataModel
import os

/// - `TOOL(name, position, assetsImageName, tab, map, game)`
/// - `PK(name, tab, map, game)`
/// - `FK(tab, map, game) REFERENCES TAB(name, map, game) ON DELETE CASCADE ON UPDATE CASCADE`
public final class SerializableToolNode: SerializableNode {
    @Lowercased private var name: String
    private let position: Int
    private let assetsImageName: String
    private let galleryRouter: SerializableGalleryRouter?
    
    private static let logger: os.Logger = .init(subsystem: "ZTronSerializable", category: "SerializableToolNode")

    public init(name: String, position: Int, assetsImageName: String, galleryRouter: SerializableGalleryRouter?) {
        self.name = name
        self.position = position
        self.assetsImageName = assetsImageName
        self.galleryRouter = galleryRouter
    }
    
    
    public func writeTo(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, shouldValidateFK: Bool) throws {
        guard let foreignKeys = foreignKeys as? SerializableTabsForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type \(String(describing: SerializableTabsForeignKeys.self)) in \(#function) on type \(#file)"
            )
        }

        if shouldValidateFK {
            let firstInvalidFK = try foreignKeys.validate(on: db)
            
            if let firstInvalidFK = firstInvalidFK {
                throw SerializableException.invalidForeignKeyException(reason: firstInvalidFK)
            }
        }

        if let galleryRouter = self.galleryRouter {
            if !Validator.validateGalleryRouter(galleryRouter.router, validateImages: true) {
                throw SerializableException.validationException(reason: "Could not validate gallery router for tool \(self.toString())")
            }
        }
        
        try DBMS.CRUD.insertIntoTool(
            or: .ignore,
            for: db,
            name: self.name,
            position: self.position,
            assetsImageName: self.assetsImageName,
            game: foreignKeys.getGame(),
            map: foreignKeys.getMap(),
            tab: foreignKeys.getTab()
        )
        
        if let galleryRouter = self.galleryRouter {
            try galleryRouter.writeTo(
                db: db,
                with: SerializableGalleryForeignKeys(tool: self.name, toolFK: foreignKeys),
                shouldValidateFK: shouldValidateFK
            )
        }
    }
    
    public func existsOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws -> Bool {
        guard let foreignKeys = foreignKeys as? SerializableTabsForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type \(String(describing: SerializableTabsForeignKeys.self)) in \(#function) on type \(#file)"
            )
        }
        
        let toolExists = try DBMS.CRUD.toolExists(for: db, tool: self.name, tab: foreignKeys.getTab(), map: foreignKeys.getMap(), game: foreignKeys.getGame())
        
        if toolExists {
            if propagate {
                if let galleryRouter = self.galleryRouter {
                    return try galleryRouter.existsOn(
                        db: db,
                        with: SerializableGalleryForeignKeys(tool: self.name, toolFK: foreignKeys),
                        propagate: propagate
                    )
                } else {
                    #if DEBUG
                    if toolExists {
                        Self.logger.info("Tool \(self.name) with FK: \(foreignKeys.toString()) exists on db")
                    }
                    #endif
                    return toolExists
                }
            } else {
                #if DEBUG
                Self.logger.info("Tool \(self.name) with FK: \(foreignKeys.toString()) exists on db")
                #endif
                return true
            }
        } else {
            return false
        }
    }
    
    public func toString() -> String {
        return """
        TOOL(
            name: \(self.name),
            position: \(self.position),
            assetsImageName: \(self.assetsImageName)
        )
        """
    }
    
    public func getPosition() -> Int {
        return self.position
    }
    
}
