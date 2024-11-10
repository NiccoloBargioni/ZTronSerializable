#if DEBUG
public func makeBinoculars() -> SerializableGalleryNode {
    let binocularsLocations = ImageRouter.init()
    
    binocularsLocations.register(
        SerializableImageNode(
            name: "recreational.area.crate.binoculars",
            description: "Lorem ipsum dolorem sit amet",
            position: 0,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    boundingBox: .init(
                        x: 1345.0/1920.0,
                        y: 608.0/1080.0,
                        width: 36.0/1920.0,
                        height: 19.0/1080.0
                    )
                )
            ]
        ), at: [">", "recreational.area.crate.binoculars"]
    )
    
    binocularsLocations.register(
        SerializableImageNode(
            name: "mess.hall.bench.binoculars",
            description: "Lorem ipsum dolorem sit amet",
            position: 1,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    boundingBox: .init(
                        x: 1125.0/1920.0,
                        y: 538.0/1080.0,
                        width: 31.0/1920.0,
                        height: 15.0/1080.0
                    )
                )
            ]
        ), at: [">", "mess.hall.bench.binoculars"]
    )
    
    
    return SerializableGalleryNode(
        name: "Binoculars",
        position: 0,
        assetsImageName: "binocularIcon",
        images: binocularsLocations
    )
}
#endif
