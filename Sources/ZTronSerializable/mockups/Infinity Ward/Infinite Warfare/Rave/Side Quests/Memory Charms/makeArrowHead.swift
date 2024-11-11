#if DEBUG
public func makeArrowHead() -> SerializableGalleryNode {
    let arrowHeadLocations = ImageRouter.init()
    
    arrowHeadLocations.register(
        SerializableImageNode(
            name: "mess.hall.signs.arrow.head",
            description: "Lorem ipsum dolorem sit amet",
            position: 0,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "mess.hall.signs.arrow.head.outline",
                    boundingBox: .init(
                        x: 331.0/1920.0,
                        y: 701.0/1080.0,
                        width: 50.0/1920.0,
                        height: 21.0/1080.0
                    )
                )
            ]
        ), at: [">", "mess.hall.signs.arrow.head"]
    )
    
    arrowHeadLocations.register(
        SerializableImageNode(
            name: "spawn.bench.right.arrow.head",
            description: "Lorem ipsum dolorem sit amet",
            position: 1,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "spawn.bench.right.arrow.head.outline",
                    boundingBox: .init(
                        x: 1044.0/1920.0,
                        y: 583.0/1080.0,
                        width: 16.0/1920.0,
                        height: 7.0/1080.0
                    )
                )
            ]
        ), at: [">", "spawn.bench.right.arrow.head"]
    )
    
    
    return SerializableGalleryNode(
        name: "Arrow Head",
        position: 2,
        assetsImageName: "arrowHeadIcon",
        images: arrowHeadLocations
    )
}
#endif
