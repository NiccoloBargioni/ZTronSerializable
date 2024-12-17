#if DEBUG
func makeRacingFuel(forPosition: Int) -> SerializableImageNode {
    assert(forPosition >= 0)
    
    return SerializableImageNode(
        name: "gas.station.outside.chemicals.lab.racing.fuel",
        description: "iw.aotrt.ee.chemicals.gas.station.outside.chemicals.lab.racing.fuel.caption",
        position: forPosition,
        overlays: [
            SerializableBoundingCircleNode(),
            SerializableOutlineNode(
                resourceName: "gas.station.outside.chemicals.lab.racing.fuel.outline",
                boundingBox: .init(
                    x: 818.0/2715.0,
                    y: 723.0/1527.0,
                    width: 21.0/2715.0,
                    height: 28.0/1527.0
                )
            )
        ]
    )
}
#endif
