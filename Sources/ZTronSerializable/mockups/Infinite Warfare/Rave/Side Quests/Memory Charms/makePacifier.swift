#if DEBUG
public func makePacifier() -> SerializableGalleryNode {
    let pacifierLocations = ImageRouter.init()
    
    pacifierLocations.register(
        SerializableImageNode(
            name: "cabin.racing.stripes.inside.pacifier",
            description: "Lorem ipsum dolorem sit amet",
            position: 0,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    boundingBox: .init(
                        x: 909.0/1920.0,
                        y: 567.0/1080.0,
                        width: 10.0/1920.0,
                        height: 6.0/1080.0
                    )
                )
            ]
        ), at: [">", "cabin.racing.stripes.inside.pacifier"]
    )
    
    pacifierLocations.register(
        SerializableImageNode(
            name: "bear.lake.kbs.wallbuy.pacifier",
            description: "Lorem ipsum dolorem sit amet",
            position: 1,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    boundingBox: .init(
                        x: 896.0/1920.0,
                        y: 539.0/1080.0,
                        width: 9.0/1920.0,
                        height: 6.0/1080.0
                    )
                )
            ]
        ), at: [">", "bear.lake.kbs.wallbuy.pacifier"]
    )
    
    
    return SerializableGalleryNode(
        name: "Pacifier",
        position: 8,
        assetsImageName: "pacifierIcon",
        images: pacifierLocations
    )
}
#endif
