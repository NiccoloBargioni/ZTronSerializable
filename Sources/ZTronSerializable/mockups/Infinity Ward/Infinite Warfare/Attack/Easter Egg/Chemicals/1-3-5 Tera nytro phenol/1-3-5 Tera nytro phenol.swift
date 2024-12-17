#if DEBUG
func make135TeraNytroPhenolGallery() -> SerializableGalleryRouter {
    let _135TeraNytroPhenolGallery = SerializableGalleryRouter()
    
    _135TeraNytroPhenolGallery.router.register(
        makePhenol(),
        at: [">", "iw.aotrt.ee.chemicals.135.tera.nytro.phenol.phenol"]
    )
    
    _135TeraNytroPhenolGallery.router.register(
        makePhenosulphuricAcid(),
        at: [">", "iw.aotrt.ee.chemicals.135.tera.nytro.phenol.phenosulphuric.acid"]
    )
    
    _135TeraNytroPhenolGallery.router.register(
        make135TeraNytroPhenol(),
        at: [">", "iw.aotrt.ee.chemicals.135.tera.nytro.phenol.135.tera.nytro.phenol"]
    )
    
    return _135TeraNytroPhenolGallery
}
#endif
