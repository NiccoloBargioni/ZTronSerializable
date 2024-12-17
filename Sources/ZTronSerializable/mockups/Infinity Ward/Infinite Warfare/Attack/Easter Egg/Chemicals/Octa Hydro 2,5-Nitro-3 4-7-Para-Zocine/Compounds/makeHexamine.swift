#if DEBUG
func makeHexamine() -> SerializableGalleryNode {
    let hexamixeCompounds = ImageRouter()
    
    let formaldehyde = makeFormaldehydeImage(forPosition: 0)
    hexamixeCompounds.register(
        formaldehyde,
        at: [">", formaldehyde.getName()]
    )
    
    hexamixeCompounds.register(
        SerializableImageNode(
            name: "beachside.market.bottom.shelf.glass.cleaner",
            description: "iw.aotrt.ee.chemicals.beachside.market.bottom.shelf.glass.cleaner.caption",
            position: 1,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "beachside.market.bottom.shelf.glass.cleaner.outline",
                    boundingBox: .init(
                        x: 1116.0/2715.0,
                        y: 745.0/1527.0,
                        width: 8.0/2715.0,
                        height: 25.0/1527.0
                    )
                )
            ]
        ),
        at: [">", "beachside.market.bottom.shelf.glass.cleaner"]
    )
    
    return SerializableGalleryNode(
        name: "iw.aotrt.ee.chemicals.octa.hydro.2.5.nitro.3.4.7.para.zocine.hexamine",
        position: 1,
        assetsImageName: "chemical.logo",
        images: hexamixeCompounds
    )
}
#endif
