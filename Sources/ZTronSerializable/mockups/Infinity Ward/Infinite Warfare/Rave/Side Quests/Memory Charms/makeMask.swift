#if DEBUG
import LoremIpsum
public func makeMask() -> SerializableGalleryNode {
    let maskLocations = ImageRouter.init()
    
    maskLocations.register(
        SerializableImageNode(
            name: "bear.lake.from.mess.hall.mask",
            description: LoremIpsum.paragraph,
            position: 0,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "bear.lake.from.mess.hall.mask.outline",
                    boundingBox: .init(
                        x: 1293.0/1920.0,
                        y: 598.0/1080.0,
                        width: 35.0/1920.0,
                        height: 41.0/1080.0
                    )
                )
            ]
        ), at: [">", "bear.lake.from.mess.hall.mask"]
    )
    
    maskLocations.register(
        SerializableImageNode(
            name: "big.fire.nv4.wallbuy.mask",
            description: LoremIpsum.paragraph,
            position: 1,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "big.fire.nv4.wallbuy.mask.outline",
                    boundingBox: .init(
                        x: 889.0/1920.0,
                        y: 512.0/1080.0,
                        width: 30.0/1920.0,
                        height: 45.0/1080.0
                    )
                )
            ]
        ), at: [">", "big.fire.nv4.wallbuy.mask"]
    )
    
    
    return SerializableGalleryNode(
        name: "iw.rave.mask.arrow_head.gallery_name",
        position: 4,
        assetsImageName: "maskIcon",
        images: maskLocations
    )
}
#endif
