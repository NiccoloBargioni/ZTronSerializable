#if DEBUG
public func makeFish() -> SerializableGalleryNode {
    let fishLocations = ImageRouter.init()
    
    fishLocations.register(
        SerializableImageNode(
            name: "cabins.below.racing.stripes.fish",
            description: "Lorem ipsum dolorem sit amet",
            position: 0,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    boundingBox: .init(
                        x: 674.0/1920.0,
                        y: 682.0/1080.0,
                        width: 44.0/1920.0,
                        height: 28.0/1080.0
                    )
                )
            ]
        ), at: [">", "cabins.below.racing.stripes.fish"]
    )
    
    fishLocations.register(
        SerializableImageNode(
            name: "pipe.mess.hall.fish",
            description: "Lorem ipsum dolorem sit amet",
            position: 1,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    boundingBox: .init(
                        x: 1734.0/1920.0,
                        y: 755.0/1080.0,
                        width: 153.0/1920.0,
                        height: 55.0/1080.0
                    )
                )
            ]
        ), at: [">", "pipe.mess.hall.fish"]
    )
    
    
    return SerializableGalleryNode(
        name: "Fish",
        position: 6,
        assetsImageName: "fishIcon",
        images: fishLocations
    )
}
#endif
