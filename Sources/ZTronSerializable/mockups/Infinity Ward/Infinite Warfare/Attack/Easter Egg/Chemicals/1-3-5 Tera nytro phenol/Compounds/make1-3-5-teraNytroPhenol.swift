#if DEBUG
func make135TeraNytroPhenol() -> SerializableGalleryNode {
    let _135TeraNytroPhenolCompounds = ImageRouter()
    
    _135TeraNytroPhenolCompounds.register(
        SerializableImageNode(
            name: "chemicals.lab.phenosulphuric.acid",
            description: "iw.aotrt.ee.chemicals.chemicals.lab.phenosulphuric.acid.caption",
            position: 0,
            overlays: []
        ),
        at: [">", "chemicals.lab.phenosulphuric.acid"]
    )
    
    let detergent = makeDetergent(forPosition: 1)
    _135TeraNytroPhenolCompounds.register(
        detergent,
        at: [">", detergent.getName()]
    )
    
    return SerializableGalleryNode(
        name: "iw.aotrt.ee.chemicals.135.tera.nytro.phenol.135.tera.nytro.phenol",
        position: 2,
        assetsImageName: "chemical.logo",
        images: _135TeraNytroPhenolCompounds
    )
}
#endif
