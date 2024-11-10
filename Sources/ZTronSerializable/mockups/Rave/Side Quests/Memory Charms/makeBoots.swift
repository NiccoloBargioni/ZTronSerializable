#if DEBUG
public func makeBoots() -> SerializableGalleryNode {
    let bootsLocation = ImageRouter.init()
    
    bootsLocation.register(
        SerializableImageNode(
            name: "bear.lake.magic.wheel.boots",
            description: "Lorem ipsum dolorem sit amet",
            position: 0,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    boundingBox: .init(
                        x: 1433.0/1920.0,
                        y: 646.0/1080.0,
                        width: 130.0/1920.0,
                        height: 98.0/1080.0
                    )
                )
            ]
        ), at: [">", "bear.lake.magic.wheel.boots"]
    )
    
    bootsLocation.register(
        SerializableImageNode(
            name: "big.fire.crate.boots",
            description: "Lorem ipsum dolorem sit amet",
            position: 1,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    boundingBox: .init(
                        x: 1571.0/1920.0,
                        y: 692.0/1080.0,
                        width: 86.0/1920.0,
                        height: 53.0/1080.0
                    )
                )
            ]
        ), at: [">", "big.fire.crate.boots"]
    )
    
    
    return SerializableGalleryNode(
        name: "Boots",
        position: 9,
        assetsImageName: "bootsIcon",
        images: bootsLocation
    )
}
#endif
