#if DEBUG
public func makeRing() -> SerializableGalleryNode {
    let ringLocations = ImageRouter.init()
    
    ringLocations.register(
        SerializableImageNode(
            name: "cave.steps.bang.bang.ring",
            description: "Lorem ipsum dolorem sit amet",
            position: 0,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    boundingBox: .init(
                        x: 707.0/1920.0,
                        y: 703.0/1080.0,
                        width: 36.0/1920.0,
                        height: 24.0/1080.0
                    )
                )
            ]
        ), at: [">", "cave.steps.bang.bang.ring"]
    )
    
    ringLocations.register(
        SerializableImageNode(
            name: "mess.hall.from.spawn.ring",
            description: "Lorem ipsum dolorem sit amet",
            position: 1,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    boundingBox: .init(
                        x: 1080.0/1920.0,
                        y: 642.0/1080.0,
                        width: 29.0/1920.0,
                        height: 22.0/1080.0
                    )
                )
            ]
        ), at: [">", "mess.hall.from.spawn.ring"]
    )
    
    
    return SerializableGalleryNode(
        name: "Ring",
        position: 3,
        assetsImageName: "ringIcon",
        images: ringLocations
    )
}
#endif
