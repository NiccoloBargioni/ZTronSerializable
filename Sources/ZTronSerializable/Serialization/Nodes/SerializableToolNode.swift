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
    private let _isSolver: Bool
    private let galleryRouters: [SerializableGalleryRouter]?
    
    private static let logger: os.Logger = .init(subsystem: "ZTronSerializable", category: "SerializableToolNode")

    public init(
        name: String,
        position: Int,
        assetsImageName: String,
        isSolver: Bool = false,
        galleryRouter: SerializableGalleryRouter?
    ) {
        self.name = name
        self.position = position
        self.assetsImageName = assetsImageName
        
        if let galleryRouter = galleryRouter {
            self.galleryRouters = [galleryRouter]
            self._isSolver = isSolver
        } else {
            self.galleryRouters = nil
            self._isSolver = true
        }
    }
    
    public init(
        name: String,
        position: Int,
        assetsImageName: String,
        isSolver: Bool = false,
        galleryRouter: [SerializableGalleryRouter]
    ) {
        self.name = name
        self.position = position
        self.assetsImageName = assetsImageName
        self.galleryRouters = galleryRouter
        
        if galleryRouter.count <= 0 {
            self._isSolver = true
        } else {
            let min = galleryRouter.reduce(0, { minDepth, toolRouter in
                return Swift.min(minDepth, toolRouter.getDepth())
            })
            
            if min <= 0 {
                self._isSolver = true
            } else {
                self._isSolver = isSolver
            }
        }
    }

    
    public func writeTo(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, shouldValidateFK: Bool) throws {
        guard let foreignKeys = foreignKeys as? SerializableToolForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type \(String(describing: SerializableToolForeignKeys.self)) in \(#function) on type \(#file)"
            )
        }

        if shouldValidateFK {
            let firstInvalidFK = try foreignKeys.validate(on: db)
            
            if let firstInvalidFK = firstInvalidFK {
                throw SerializableException.invalidForeignKeyException(reason: firstInvalidFK)
            }
        }

        
        if let galleryRouters = self.galleryRouters {
            for galleryRouter in galleryRouters {
                if !Validator.validateGalleryRouter(galleryRouter.router, validateImages: true) {
                    throw SerializableException.validationException(
                        reason: "Could not validate gallery router for tool \(self.toString())"
                    )
                }
            }
        }
        
        try DBMS.CRUD.insertIntoTool(
            or: .ignore,
            for: db,
            name: self.name,
            position: self.position,
            assetsImageName: self.assetsImageName,
            isSolver: self._isSolver,
            game: foreignKeys.getGame(),
            map: foreignKeys.getMap(),
            tab: foreignKeys.getTab()
        )
        
        if let galleryRouters = self.galleryRouters {
            for galleryRouter in galleryRouters {
                try galleryRouter.writeTo(
                    db: db,
                    with: SerializableGalleryForeignKeys(tool: self.name, toolFK: foreignKeys),
                    shouldValidateFK: shouldValidateFK
                )
            }
        }
    }
    
    public func existsOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws -> Bool {
        guard let foreignKeys = foreignKeys as? SerializableToolForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type \(String(describing: SerializableToolForeignKeys.self)) in \(#function) on type \(#file)"
            )
        }
        
        let toolExists = try DBMS.CRUD.toolExists(for: db, tool: self.name, tab: foreignKeys.getTab(), map: foreignKeys.getMap(), game: foreignKeys.getGame())
        
        if toolExists {
            if propagate {
                if let galleryRouters = self.galleryRouters {
                    var exists: Bool = true
                    for galleryRouter in galleryRouters {
                        guard exists else { break }
                        try exists = exists && galleryRouter.existsOn(
                            db: db,
                            with: SerializableGalleryForeignKeys(tool: self.name, toolFK: foreignKeys),
                            propagate: propagate
                        )
                    }
                    
                    return exists
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
            isSolver: \(self._isSolver)
        )
        """
    }
    
    public func getPosition() -> Int {
        return self.position
    }
    
    public func getAssetsImageName() -> String {
        return self.assetsImageName
    }
    
    public func getName() -> String {
        return self.name
    }
    
    public final func isSolver() -> Bool {
        return self._isSolver
    }
    
    public func deleteDanglingReferencesOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws {
        guard let foreignKeys = foreignKeys as? SerializableToolForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableToolForeignKeys in \(#function) on type \(#file)"
            )
        }
        
        try self.galleryRouters?.forEach { galleryRouter in
            try galleryRouter.deleteDanglingReferencesOn(db: db, with: SerializableGalleryForeignKeys(tool: self.name, toolFK: foreignKeys), propagate: propagate)
        }
    }
    
    
    public func updateOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws {
        guard let foreignKeys = foreignKeys as? SerializableToolForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableToolForeignKeys in \(#function) on type \(#file)"
            )
        }
        
        try self.galleryRouters?.forEach { galleryRouter in
            try galleryRouter.updateOn(db: db, with: SerializableGalleryForeignKeys(tool: self.name, toolFK: foreignKeys), propagate: propagate)
        }
    }
    
}
