#if DEBUG

func make34DiNitroxyMethylPropaneGallery() -> SerializableGalleryRouter {
    let _34DiNitroxyMethylPropaneGallery = SerializableGalleryRouter()
    
    _34DiNitroxyMethylPropaneGallery.router.register(
        makeAcetaldehyde(),
        at: [">", "iw.aotrt.ee.chemicals.3.4.di.nitroxy.methyilpropane.acetaldehyde"]
    )
    
    _34DiNitroxyMethylPropaneGallery.router.register(
        makeFormaldehyde(forPosition: 1, chemicalID: "3.4.di.nitroxy.methyilpropane"),
        at: [">", "iw.aotrt.ee.chemicals.3.4.di.nitroxy.methyilpropane.formaldehyde"]
    )
    
    _34DiNitroxyMethylPropaneGallery.router.register(
        makeAldehydeSludge(),
        at: [">", "iw.aotrt.ee.chemicals.3.4.di.nitroxy.methyilpropane.aldehyde.sludge"]
    )

    _34DiNitroxyMethylPropaneGallery.router.register(
        make34DiNitroxyMethylPropane(),
        at: [">", "iw.aotrt.ee.chemicals.3.4.di.nitroxy.methyilpropane.3.4.di.nitroxy.methyilpropane"]
    )

    return _34DiNitroxyMethylPropaneGallery
}

#endif
