#if DEBUG
func makeDinitro() -> SerializableGalleryNode {
    let dinitroCompounds = ImageRouter()
        
    dinitroCompounds.register(
        SerializableImageNode(
            name: "chemicals.lab.methylbenzene",
            description: "iw.aotrt.ee.chemicals.chemicals.lab.methylbenzene.caption",
            position: 0,
            overlays: []
        ),
        at: [">", "chemicals.lab.methylbenzene"]
    )
    
    let vinegar = makeVinegar(forPosition: 1)
    dinitroCompounds.register(vinegar, at: [">", vinegar.getName()])
    
    
    dinitroCompounds.register(
        SerializableImageNode(
            name: "beachside.market.shelf.baking.soda",
            description: "iw.aotrt.ee.chemicals.beachside.market.shelf.baking.soda.caption",
            position: 2,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "beachside.market.shelf.baking.soda.outline",
                    boundingBox: .init(
                        x: 1273.0/2715.0,
                        y: 696.0/1527.0,
                        width: 20.0/2715.0,
                        height: 8.0/1527.0
                    )
                )
            ]
        ),
        at: [">", "beachside.market.shelf.baking.soda"]
    )
    
    let detergent = makeDetergent(forPosition: 3)
    dinitroCompounds.register(detergent, at: [">", detergent.getName()])
    
    
    return SerializableGalleryNode(
        name: "iw.aotrt.ee.chemicals.3.4.methyl.2.4.dinitrobenzene.dinitro",
        position: 1,
        assetsImageName: "chemical.logo",
        images: dinitroCompounds
    )

}
#endif

