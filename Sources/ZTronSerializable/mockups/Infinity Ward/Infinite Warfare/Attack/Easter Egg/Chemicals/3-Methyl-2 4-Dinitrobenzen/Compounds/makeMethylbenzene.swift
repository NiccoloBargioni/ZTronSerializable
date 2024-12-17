#if DEBUG
func makeMethylbenzene() -> SerializableGalleryNode {
    let methylbenzeneCompounds = ImageRouter()
        
    methylbenzeneCompounds.register(
        SerializableImageNode(
            name: "racing.stripes.paint",
            description: "iw.aotrt.ee.chemicals.racing.stripes.paint.caption",
            position: 0,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "racing.stripes.paint.outline",
                    boundingBox: .init(
                        x: 1146.0/2715.0,
                        y: 795.0/1527.0,
                        width: 29.0/2715.0,
                        height: 27.0/1527.0
                    )
                )
            ]
        ),
        at: [">", "racing.stripes.paint"]
    )
    
    let detergent = makeDetergent(forPosition: 1)
    methylbenzeneCompounds.register(detergent, at: [">", detergent.getName()])
    
    let drainOpener = makeDrainOpener(forPosition: 1)
    methylbenzeneCompounds.register(drainOpener, at: [">", drainOpener.getName()])

    return SerializableGalleryNode(
        name: "iw.aotrt.ee.chemicals.3.4.methyl.2.4.dinitrobenzene.methylbenzene",
        position: 0,
        assetsImageName: "chemical.logo",
        images: methylbenzeneCompounds
    )

}
#endif

