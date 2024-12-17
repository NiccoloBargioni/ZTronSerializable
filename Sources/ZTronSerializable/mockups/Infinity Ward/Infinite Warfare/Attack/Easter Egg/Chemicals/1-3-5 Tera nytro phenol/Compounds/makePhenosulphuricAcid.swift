#if DEBUG
func makePhenosulphuricAcid() -> SerializableGalleryNode {
    let phenosulphuricAcidCompounds = ImageRouter()
    
    phenosulphuricAcidCompounds.register(
        SerializableImageNode(
            name: "chemicals.lab.phenol",
            description: "iw.aotrt.ee.chemicals.chemicals.lab.phenol.caption",
            position: 0,
            overlays: []
        ),
        at: [">", "chemicals.lab.phenol"]
    )
    
    let drainOpener = makeDrainOpener(forPosition: 1)
    phenosulphuricAcidCompounds.register(
        drainOpener,
        at: [">", drainOpener.getName()]
    )
    
    return SerializableGalleryNode(
        name: "iw.aotrt.ee.chemicals.phenosulphuric.acid",
        position: 1,
        assetsImageName: "chemical.logo",
        images: phenosulphuricAcidCompounds
    )
}
#endif
