#if DEBUG
import LoremIpsum


public func makeBilliardBall() -> SerializableGalleryNode {
    let billiardBallLocations = ImageRouter.init()
    
    billiardBallLocations.register(
        SerializableImageNode(
            name: "caves.recreational.area.sign.billiard.ball",
            description: LoremIpsum.paragraph,
            position: 0,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "caves.recreational.area.sign.billiard.ball.outline",
                    boundingBox: .init(
                        x: 965.0/1920.0,
                        y: 600.0/1080.0,
                        width: 24.0/1920.0,
                        height: 24.0/1080.0
                    )
                )
            ]
        ), at: [">", "caves.recreational.area.sign.billiard.ball"]
    )
    
    billiardBallLocations.register(
        SerializableImageNode(
            name: "quickies.rave.area.billiard.ball",
            description: LoremIpsum.paragraph,
            position: 1,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "quickies.rave.area.billiard.ball.outline",
                    boundingBox: .init(
                        x: 539.0/1920.0,
                        y: 658.0/1080.0,
                        width: 20.0/1920.0,
                        height: 18.0/1080.0
                    )
                )
            ]
        ), at: [">", "quickies.rave.area.billiard.ball"]
    )
    
    
    return SerializableGalleryNode(
        name: "Billiard Ball",
        position: 5,
        assetsImageName: "billiardBallIcon",
        images: billiardBallLocations
    )
}
#endif
