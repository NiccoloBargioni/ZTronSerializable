import Foundation
import SQLite
import ZTronRouter
import ZTronDataModel
import os

public class SerializableGalleryNode: SerializableNode {
    public typealias MediasRouter = ZTronRouter<Empty, any SerializableVisualMediaNode, SerializableImageNode.NavigationParameters>
    
    @Lowercased private var name: String
    private let position: Int
    private let assetsImageName: String?
    private let searchToken: SerializableGallerySearchTokenNode?
    private let medias: MediasRouter
    private var didSerializeGallery: Bool = false
    
    private static let logger: os.Logger = .init(subsystem: "ZTronSerializable", category: "SerializableGalleryNode")
    
    public init(
        name: String,
        position: Int,
        assetsImageName: String?,
        searchToken: SerializableGallerySearchTokenNode? = nil,
        images: MediasRouter
    ) {
        self.name = name
        self.position = position
        self.assetsImageName = assetsImageName
        self.searchToken = searchToken
        self.medias = images
    }
    
    public func getName() -> String {
        return self.name
    }
    
    public func getPosition() -> Int {
        return self.position
    }
    
    public func getAssetsImageName() -> String? {
        return self.assetsImageName
    }
    
    public func getSearchToken() -> SerializableGallerySearchTokenNode? {
        return self.searchToken
    }
    
    public func getMedias() -> MediasRouter {
        return self.medias
    }
    
    public func toString() -> String {
        return """
            GALLERY(
                name: \(self.name),
                assetsImageName: \(String(describing: self.assetsImageName)),
                searchToken: \(String(describing: self.searchToken?.toString()))
            )
            """
    }
    
    internal func writeGalleryEntryTo(db: Connection, with foreignKeys: any SerializableForeignKeys, shouldValidateFK: Bool = false) throws {
        guard !self.didSerializeGallery else { return }
        
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
        
        try DBMS.CRUD.insertIntoGallery(
            or: .ignore,
            for: db,
            name: self.name,
            position: self.position,
            assetsImageName: self.assetsImageName,
            game: foreignKeys.getGame(),
            map: foreignKeys.getMap(),
            tab: foreignKeys.getTab(),
            tool: foreignKeys.getTool()
        )
        
        try self.searchToken?.writeTo(db: db, with: foreignKeys, shouldValidateFK: shouldValidateFK)
        
        self.didSerializeGallery = true
    }
    
    
    // MARK: - Serializable
    public func writeTo(db: Connection, with foreignKeys: any SerializableForeignKeys, shouldValidateFK: Bool = false) throws {
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
        if !Validator.validateMediasRouter(self.medias) {
            throw SerializableException.validationException(reason: "Couldn't validate images for \(self.name)")
        }
#endif
        
        try self.writeGalleryEntryTo(db: db, with: foreignKeys, shouldValidateFK: shouldValidateFK)
        
        try self.medias.forEach { absolutePath, output, params in
            
            let imageFK = SerializableImageForeignKeys(
                gallery: self.name,
                galleryFK: foreignKeys
            )
            
            try output.writeTo(db: db, with: imageFK, shouldValidateFK: shouldValidateFK)
            
            if absolutePath.count > 2 {
                guard let params = params else {
                    throw SerializableException.illegalGraphStructureException(reason: "Expected params for image variants")
                }
                
                guard let master = self.medias.peek(
                    at: Array.array(
                        subsequence: absolutePath.prefix(upTo: absolutePath.count - 1)
                    )
                )?.getName() else { fatalError("Gaps not allowed in \(String(describing: Self.self)) for \(self.toString())") }
                
                try SerializableImageVariantRelationshipNode(
                    master: master,
                    slave: output.getName(),
                    variant: absolutePath.last!,
                    bottomBarIcon: params.getBottomBarIcon(),
                    goBackBottomBarIcon: params.getGoBackBottomBarIcon(),
                    boundingFrame: params.getBoundingFrame()
                )
                .writeTo(db: db, with: imageFK, shouldValidateFK: shouldValidateFK)
            }
        }
    }
    
    public func existsOn(db: SQLite.Connection, with foreignKeys: SerializableForeignKeys, propagate: Bool) throws -> Bool {
        guard let foreignKeys = foreignKeys as? SerializableGalleryForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableGalleryForeignKeys in \(#function) on type \(#file)"
            )
        }
        
        // If a gallery search token exists, verify that it's on the db
        if let searchToken = self.searchToken {
            if !(try searchToken.existsOn(
                db: db,
                with: SerializableImageForeignKeys(
                    gallery: self.name,
                    galleryFK: foreignKeys
                ),
                propagate: false
            )) {
#if DEBUG
                Self.logger.log(level: .error, "Search Token \(searchToken.getTitle()) does not exist on gallery \(self.toString())")
#endif
                return false
            }
        }
        
        
        if medias.getRoutesCount() <= 0 {
            
            /// If no images are included in this gallery, just verify if the record for this Gallery exists on the db
            return try DBMS.CRUD.galleryExists(
                for: db,
                gallery: self.name,
                game: foreignKeys.getGame(),
                map: foreignKeys.getMap(),
                tab: foreignKeys.getTab(),
                tool: foreignKeys.getTool()
            )
        } else {
            /// - Count the master images in this gallery.
            /// - if `propagate == false`, check that #(masters, db) = #(masters, self)
            /// - If `propagate == true`, check that the number of #(image, db) = #(image, self) for this gallery, and verify individual master-slave relationships
            var imageMasters = 0
            
            
            self.medias.forEachBFS { absolutePath, output in
                if absolutePath.count == 1 {
                    imageMasters += 1
                }
            }
            
            /// In order for countImagesForGallery with `includeVariants: false` to produce the correct result,
            /// the images variants relationships must be correct at least at the top level.
            let dbImagesMastersForThisGallery = try DBMS.CRUD.countImagesForGallery(
                includeVariants: false,
                for: db,
                game: foreignKeys.getGame(),
                map: foreignKeys.getMap(),
                tab: foreignKeys.getTab(),
                tool: foreignKeys.getTool(),
                gallery: self.name
            )
            
            if !propagate {
                /// Note that if there is at least one image for this gallery, then this gallery exists, because `Image`s under this gallery
                /// have referential integrity contraints with respect to this gallery, i.e. they cannot exist in the db before this gallery exists.
                return dbImagesMastersForThisGallery != imageMasters
            } else {
                if dbImagesMastersForThisGallery < imageMasters {
#if DEBUG
                    Self.logger.error("Expected to find \(imageMasters) masters on db, found \(dbImagesMastersForThisGallery) instead")
#endif
                    return false
                } else {
                    do {
                        try self.medias.forEach { absolutePath, output, params in
                            let imageFK = SerializableImageForeignKeys(
                                gallery: self.name,
                                galleryFK: foreignKeys
                            )
                            
                            if !(try output.existsOn(
                                db: db,
                                with: imageFK,
                                propagate: true
                            )
                            ) {
                                throw SerializableException.illegalGraphStructureException(reason: "Image \(output.getName()) could not be validated on db")
                            }
                            
                            if absolutePath.count > 2 {
                                guard let params = params else {
                                    throw SerializableException.illegalGraphStructureException(reason: "Expected params for image variants @ \(absolutePath)")
                                }
                                
                                if !(
                                    try SerializableImageVariantRelationshipNode(
                                        master: absolutePath[absolutePath.count-2],
                                        slave: output.getName(),
                                        variant: absolutePath.last!,
                                        bottomBarIcon: params.getBottomBarIcon(),
                                        goBackBottomBarIcon: params.getGoBackBottomBarIcon(),
                                        boundingFrame: params.getBoundingFrame()
                                    )
                                    .existsOn(db: db, with: imageFK, propagate: true)
                                ) {
                                    throw SerializableException.illegalGraphStructureException(reason: "Could not validate relationship \(absolutePath[absolutePath.count-2]) -> \(output.getName()) on db")
                                }
                            }
                        }
                    } catch SerializableException.illegalGraphStructureException(let reason) {
                        #if DEBUG
                        Self.logger.error("\(reason)")
                        #endif
                        return false
                    }
                    
                    return true
                }
            }
        }
    }
    
    
    /// - Note: Nothing to do, `SerializableGallerySearchTokenNode` is a leaf.
    /// - Note: This should `DELETE CASCADE` all master-slave relationship from db as well
    /// - Note: `propagate` should be unnecessary: removing dangling content for a gallery should delete all of their subtrees
    public func deleteDanglingReferencesOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws {
        guard let foreignKeys = foreignKeys as? SerializableGalleryForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableGalleryForeignKeys in \(#function) on type \(#file)"
            )
        }
        
        if propagate {
            try self.medias.forEach { absolutePath, output in
                try output.deleteDanglingReferencesOn(
                    db: db,
                    with: SerializableImageForeignKeys(gallery: self.name, galleryFK: foreignKeys),
                    propagate: propagate
                )
            }
        }
        
        var imagesVariantsTree: [String: [any SerializableVisualMediaNode]] = [:]
        var firstLevelOfMastersImages: [String: any SerializableVisualMediaNode] = [:]
        
        try self.medias.forEach { absolutePath, output, params in
            if absolutePath.count > 2 {
                let master = absolutePath[absolutePath.count-2]
                
                if imagesVariantsTree[master] == nil {
                    imagesVariantsTree[master] = []
                }
                
                imagesVariantsTree[master]?.append(output)
            } else {
                let nameOfThisImage = output.getName()
                
                if firstLevelOfMastersImages[nameOfThisImage] == nil {
                    firstLevelOfMastersImages[nameOfThisImage] = output
                } else {
                    Self.logger.warning("Attempted to overwrite duplicate first level image \(nameOfThisImage) for gallery \(self.name)")
                    return
                }
            }
            
            try imagesVariantsTree.keys.forEach { imageMasterName in
                if let slavesOfMaster = imagesVariantsTree[imageMasterName] {
                    var firstLevelOfSlaves: [String: any SerializableVisualMediaNode] = [:]
                    
                    slavesOfMaster.forEach { slave in
                        firstLevelOfSlaves[slave.getName()] = slave
                    }
                    
                    try DBMS.CRUD.batchDeleteFirstSlaveImagesForImage(
                        for: db,
                        master: imageMasterName,
                        gallery: self.name,
                        tool: foreignKeys.getTool(),
                        tab: foreignKeys.getTab(),
                        map: foreignKeys.getMap(),
                        game: foreignKeys.getGame(),
                        shouldDecreasePositions: false
                    ) { slaveModel in
                        return firstLevelOfSlaves[slaveModel.getName()] == nil
                    }
                }
            }
        }
            
        try DBMS.CRUD.batchDeleteFirstLevelImagesForGallery(
            for: db,
            gallery: self.name,
            tool: foreignKeys.getTool(),
            tab: foreignKeys.getTab(),
            map: foreignKeys.getMap(),
            game: foreignKeys.getGame(),
            shouldDecreasePositions: false
        ) { imageModel in
            return firstLevelOfMastersImages[imageModel.getName()] == nil
        }
    }
    
    
    
    public func updateOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws {
        guard let foreignKeys = foreignKeys as? SerializableGalleryForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type SerializableGalleryForeignKeys in \(#function) on type \(#file)"
            )
        }
        
        var imagesVariantsTree: [String: [any SerializableVisualMediaNode]] = [:]
        var firstLevelOfMastersImages: [String: any SerializableVisualMediaNode] = [:]
        
        
        try self.medias.forEach { absolutePath, output, params in
            if absolutePath.count > 2 {
                let master = absolutePath[absolutePath.count-2]
                
                if imagesVariantsTree[master] == nil {
                    imagesVariantsTree[master] = []
                }
                
                imagesVariantsTree[master]?.append(output)
                
                if let params = params {
                    try DBMS.CRUD.updateVisualMediaMasterSlaveRelationshipsForMaster(
                        for: db,
                        master: master,
                        gallery: self.name,
                        tool: foreignKeys.getTool(),
                        tab: foreignKeys.getTab(),
                        map: foreignKeys.getMap(),
                        game: foreignKeys.getGame()
                    ) { variantDraft in
                        variantDraft
                            .withOrigin(params.getBoundingFrame()?.origin)
                            .withSize(params.getBoundingFrame()?.size)
                            .withBottomBarIcon(params.getBottomBarIcon())
                            .withGoBackBottomBarIcon(params.getGoBackBottomBarIcon())
                    } validate: { metadataModels in
                        return metadataModels.reduce(true) { isValid, nextMetadataModel in
                            let boundingFrame = nextMetadataModel.getBoundingFrame()
                            
                            if let boundingFrame = boundingFrame {
                                return isValid &&
                                    (boundingFrame.origin.x >= 0 && boundingFrame.origin.x <= 1) &&
                                    (boundingFrame.origin.y >= 0 && boundingFrame.origin.y <= 1) &&
                                    (boundingFrame.size.width >= 0 && boundingFrame.size.width <= 1) &&
                                    (boundingFrame.size.height >= 0 && boundingFrame.size.height <= 1)
                            } else {
                                return true
                            }
                        }
                    }
                } else {
                    throw SerializableException.illegalGraphStructureException(reason: "Expected params for image variants @ \(absolutePath)")
                }

            } else {
                let nameOfThisImage = output.getName()
                
                if firstLevelOfMastersImages[nameOfThisImage] == nil {
                    firstLevelOfMastersImages[nameOfThisImage] = output
                } else {
                    Self.logger.warning("Attempted to overwrite duplicate first level image \(nameOfThisImage) for gallery \(self.name)")
                    return
                }
            }
        }
        
        
        try imagesVariantsTree.keys.forEach { masterId in
            if let variantsOfThisImage = imagesVariantsTree[masterId] {
                var slavesModels: [String: any SerializableVisualMediaNode] = [:]
                
                variantsOfThisImage.forEach { slaveModel in
                    slavesModels[slaveModel.getName()] = slaveModel
                }
                
                try DBMS.CRUD.updateFirstLevelVariantsOfImageForGallery(
                    for: db,
                    master: masterId,
                    gallery: self.name,
                    tool: foreignKeys.getTool(),
                    tab: foreignKeys.getTab(),
                    map: foreignKeys.getMap(),
                    game: foreignKeys.getGame()
                ) { slaveDraft in
                    guard let slaveNode = slavesModels[slaveDraft.getName()] else { return }
                    
                    slaveDraft
                        .withPosition(slaveNode.getPosition())
                        .withDescription(slaveNode.getDescription())
                        .withSearchLabel(slaveNode.getSearchLabel())
                } validate: { slaves in
                    return Validator.validatePositions(slaves.map({ slaveModel in
                        slaveModel.getPosition()
                    }))
                }
            }
        }
        
        try DBMS.CRUD.updateMasterVisualMediasForGallery(
            for: db,
            gallery: self.name,
            tool: foreignKeys.getTool(),
            tab: foreignKeys.getTab(),
            map: foreignKeys.getMap(),
            game: foreignKeys.getGame()
        ) { masterDraft in
            guard let masterNode = firstLevelOfMastersImages[masterDraft.getName()] else { return }
            
            masterDraft
                .withPosition(masterNode.getPosition())
                .withDescription(masterNode.getDescription())
                .withSearchLabel(masterNode.getSearchLabel())
        } validate: { masters in
            return Validator.validatePositions(masters.map({ masterNode in
                return masterNode.getPosition()
            }))
        }

        
        if propagate {
            try self.medias.forEach { _, mediaNode in
                try mediaNode.updateOn(db: db, with: SerializableImageForeignKeys(gallery: self.name, galleryFK: foreignKeys), propagate: propagate)
            }
        }

    }
}

