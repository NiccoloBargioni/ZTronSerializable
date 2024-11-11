#if DEBUG
public func makeMask() -> SerializableGalleryNode {
    let maskLocations = ImageRouter.init()
    
    maskLocations.register(
        SerializableImageNode(
            name: "bear.lake.from.mess.hall.mask",
            description: "Lorem ipsum dolorem sit amet",
            position: 0,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
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
            description: "Lorem ipsum dolorem sit amet",
            position: 1,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
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
        name: "Mask",
        position: 4,
        assetsImageName: "maskIcon",
        images: maskLocations
    )
}
#endif
