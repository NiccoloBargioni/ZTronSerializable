#if DEBUG
public func makeShovel() -> SerializableGalleryNode {
    let shovelLocations = ImageRouter.init()
    
    shovelLocations.register(
        SerializableImageNode(
            name: "archer.range.shovel",
            description: "Lorem ipsum dolorem sit amet",
            position: 0,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    boundingBox: .init(
                        x: 921.0/1920.0,
                        y: 526.0/1080.0,
                        width: 11.0/1920.0,
                        height: 14.0/1080.0
                    )
                )
            ]
        ), at: [">", "archer.range.shovel"]
    )
    
    shovelLocations.register(
        SerializableImageNode(
            name: "bang.bangs.cave.shovel",
            description: "Lorem ipsum dolorem sit amet",
            position: 1,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    boundingBox: .init(
                        x: 302.0/1920.0,
                        y: 568.0/1080.0,
                        width: 89.0/1920.0,
                        height: 186.0/1080.0
                    )
                )
            ]
        ), at: [">", "bang.bangs.cave.shovel"]
    )
    
    
    return SerializableGalleryNode(
        name: "Shovel",
        position: 1,
        assetsImageName: "shovelIcon",
        images: shovelLocations
    )
}
#endif
