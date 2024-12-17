#if DEBUG

// MARK: - PHENOL
func makePhenol() -> SerializableGalleryNode {
    let compondsFor135TeraNytroPhenol: ImageRouter = .init()
        
    compondsFor135TeraNytroPhenol.register(
        SerializableImageNode(
            name: "chemicals.lab.motor.oil",
            description: "iw.aotrt.ee.chemicals.chemicals.lab.motor.oil.caption",
            position: 0,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "chemicals.lab.motor.oil.outline",
                    boundingBox: .init(
                        x: 1129.0/2715.0,
                        y: 666.0/1527.0,
                        width: 27.0/2715.0,
                        height: 37.0/1527.0
                    )
                )
            ]
        ),
        at: [">", "chemicals.lab.motor.oil"]
    )
    
    compondsFor135TeraNytroPhenol.register(
        SerializableImageNode(
            name: "beachside.market.shelf.wheel.cleaner",
            description: "iw.aotrt.ee.chemicals.beachside.market.shelf.wheel.cleaner.caption",
            position: 1,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "beachside.market.shelf.wheel.cleaner.outline",
                    boundingBox: .init(
                        x: 1145.0/2715.0,
                        y: 582.0/1527.0,
                        width: 13.0/2715.0,
                        height: 38.0/1527.0
                    )
                )
            ]
        ),
        at: [">", "beachside.market.shelf.wheel.cleaner"]
    )
    
    compondsFor135TeraNytroPhenol.register(
        SerializableImageNode(
            name: "spawn.room.bugs.repellent",
            description: "iw.aotrt.ee.chemicals.beachside.market.shelf.wheel.cleaner.caption",
            position: 2,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "spawn.room.bugs.repellent.outline",
                    boundingBox: .init(
                        x: 1203.0/2715.0,
                        y: 709.0/1527.0,
                        width: 8.0/2715.0,
                        height: 22.0/1527.0
                    )
                )
            ]
        ),
        at: [">", "spawn.room.bugs.repellent"]
    )
    
    return SerializableGalleryNode(
        name: "iw.aotrt.ee.chemicals.phenol",
        position: 0,
        assetsImageName: "chemical.logo",
        images: compondsFor135TeraNytroPhenol
    )
}
#endif
