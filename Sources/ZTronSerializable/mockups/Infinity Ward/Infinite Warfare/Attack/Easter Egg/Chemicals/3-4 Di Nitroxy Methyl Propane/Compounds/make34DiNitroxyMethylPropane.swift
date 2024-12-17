#if DEBUG
func make34DiNitroxyMethylPropane() -> SerializableGalleryNode {
    let _34DiNytroxyMethylPropaneCompounds = ImageRouter()
    
    _34DiNytroxyMethylPropaneCompounds.register(
        SerializableImageNode(
            name: "chemicals.lab.aldehyde.sludge",
            description: "iw.aotrt.ee.chemicals.chemicals.lab.aldehyde.sludge.caption",
            position: 0,
            overlays: []
        ),
        at: [">", "chemicals.lab.aldehyde.sludge"]
    )
    
    _34DiNytroxyMethylPropaneCompounds.register(
        SerializableImageNode(
            name: "motel.reception.room.nail.polish",
            description: "iw.aotrt.ee.chemicals.motel.reception.room.nail.polish.caption",
            position: 1,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "motel.reception.room.nail.polish.outline",
                    boundingBox: .init(
                        x: 1509.0/2715.0,
                        y: 747.0/1527.0,
                        width: 11.0/2715.0,
                        height: 35.0/1527.0
                    )
                )
            ]
        ),
        at: [">", "motel.reception.room.nail.polish"]
    )
    
    return SerializableGalleryNode(
        name: "iw.aotrt.ee.chemicals.3.4.di.nitroxy.methyl.propane",
        position: 3,
        assetsImageName: "chemical.logo",
        images: _34DiNytroxyMethylPropaneCompounds
    )
}
#endif
