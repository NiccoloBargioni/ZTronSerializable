#if DEBUG
import LoremIpsum

public func makeFrog() -> SerializableGalleryNode {
    let frogLocations = ImageRouter.init()
    
    frogLocations.register(
        SerializableImageNode(
            name: "atm.room.frog",
            description: LoremIpsum.paragraph,
            position: 0,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "atm.room.frog.outline",
                    boundingBox: .init(
                        x: 637/1920.0,
                        y: 522.0/1080.0,
                        width: 11.0/1920.0,
                        height: 6.0/1080.0
                    )
                )
            ]
        ), at: [">", "atm.room.frog"]
    )

    
    frogLocations.register(
        SerializableImageNode(
            name: "recreational.area.camper.exit.frog",
            description: LoremIpsum.paragraph,
            position: 1,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "recreational.area.camper.exit.frog.outline",
                    boundingBox: .init(
                        x: 1688.0/1920.0,
                        y: 503.0/1080.0,
                        width: 62.0/1920.0,
                        height: 23.0/1080.0
                    )
                )
            ]
        ), at: [">", "recreational.area.camper.exit.frog"]
    )
    
    
    return SerializableGalleryNode(
        name: "iw.rave.memory_charms.frog.gallery_name",
        position: 7,
        assetsImageName: "frogIcon",
        images: frogLocations
    )
}
#endif
