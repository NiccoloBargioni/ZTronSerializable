#if DEBUG
func makeVinegar(forPosition: Int) -> SerializableImageNode {
    assert(forPosition >= 0)
    
    return SerializableImageNode(
        name: "beachside.market.entrance.vinegar",
        description: "iw.aotrt.ee.chemicals.beachside.market.entrance.vinegar.caption",
        position: forPosition,
        overlays: [
            SerializableBoundingCircleNode(),
            SerializableOutlineNode(
                resourceName: "beachside.market.entrance.vinegar.outline",
                boundingBox: .init(
                    x: 1503.0/2715.0,
                    y: 583.0/1527.0,
                    width: 20.0/2715.0,
                    height: 65.0/1527.0
                )
            )
        ]
    )
}
#endif
