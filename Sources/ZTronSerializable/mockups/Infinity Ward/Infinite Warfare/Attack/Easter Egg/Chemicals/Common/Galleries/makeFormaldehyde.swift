#if DEBUG
func makeFormaldehyde(forPosition: Int) -> SerializableGalleryNode {
    assert(forPosition >= 0)
    
    let formaldehydeCompounds = ImageRouter()
    
    let fuel = makeRacingFuel(forPosition: 0)
    formaldehydeCompounds.register(fuel, at: [">", fuel.getName()])
    
    formaldehydeCompounds.register(
        SerializableImageNode(
            name: "left.of.gas.station.call.box.silver.pennies",
            description: "iw.aotrt.ee.chemicals.left.of.gas.station.call.box.silver.pennies.caption",
            position: 0,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "left.of.gas.station.call.box.silver.pennies.outline",
                    boundingBox: .init(
                        x: 1195.0/2715.0,
                        y: 702.0/1527.0,
                        width: 15.0/2715.0,
                        height: 34.0/1527.0
                    )
                )
            ]
        ),
        at: [">", "gas.station.outside.chemicals.lab.racing.fuel"]
    )
    
    
    return SerializableGalleryNode(
        name: "iw.aotrt.ee.chemicals.formaldehyde",
        position: forPosition,
        assetsImageName: "chemical.logo",
        images: formaldehydeCompounds
    )
}
#endif
