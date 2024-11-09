import Foundation
import SQLite
import ZTronRouter
import ZTronDataModel

public class SerializableGalleryNode: SerializableNode {
    public typealias ImagesRouter = ZTronRouter<Empty, SerializableImageNode, SerializableImageNode.NavigationParameters>
    
    @Lowercased private var name: String
    private let position: Int
    private let assetsImageName: String?
    private let searchToken: SerializableGallerySearchTokenNode?
    private let images: ImagesRouter
    
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
        if !Validator.validateImagesRouter(self.images) {
            throw SerializableException.validationException(reason: "Couldn't validate images for \(self.name)")
        }
        #endif

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
        
        try self.images.forEach { absolutePath, output, params in
            
            let imageFK = SerializableImageForeignKeys(
                gallery: self.name,
                galleryFK: foreignKeys
            )
            
            try output.writeTo(db: db, with: imageFK, shouldValidateFK: shouldValidateFK)
            
            if absolutePath.count > 2 {
                guard let params = params else {
                    throw SerializableException.illegalGraphStructureException(reason: "Expected params for image variants")
                }
                                
                try SerializableImageVariantRelationshipNode(
                    master: absolutePath[absolutePath.count-2],
                    slave: output.getName(),
                    variant: absolutePath.last!,
                    bottomBarIcon: params.getBottomBarIcon(),
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
        if !(try self.searchToken?.existsOn(
            db: db,
            with: SerializableImageForeignKeys(
                gallery: self.name,
                galleryFK: foreignKeys
            ),
            propagate: false
        ) ?? true) {
            print("Search Token for \(self.name) does not exist on gallery \(self.name)")
            return false
        }
        
        
        if images.getRoutesCount() <= 0 {
            
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
            
            
            self.images.forEachBFS { absolutePath, output in
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
                    print("Expected to find \(imageMasters) masters on db, found \(dbImagesMastersForThisGallery) instead")
                    return false
                } else {
                    do {
                        try self.images.forEach { absolutePath, output, params in
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
                                        boundingFrame: params.getBoundingFrame()
                                    )
                                    .existsOn(db: db, with: imageFK, propagate: true)
                                ) {
                                    throw SerializableException.illegalGraphStructureException(reason: "Could not validate relationship \(absolutePath[absolutePath.count-2]) -> \(output.getName()) on db")
                                }
                            }
                        }
                    } catch SerializableException.illegalGraphStructureException(let reason) {
                        print(reason)
                        return false
                    }
                    
                    return true
                }
            }
        }
    }
    
    public init(
        name: String,
        position: Int,
        assetsImageName: String?,
        searchToken: SerializableGallerySearchTokenNode? = nil,
        images: ImagesRouter
    ) {
        self.name = name
        self.position = position
        self.assetsImageName = assetsImageName
        self.searchToken = searchToken
        self.images = images
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
    
    public func getImages() -> ImagesRouter {
        return self.images
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
}
