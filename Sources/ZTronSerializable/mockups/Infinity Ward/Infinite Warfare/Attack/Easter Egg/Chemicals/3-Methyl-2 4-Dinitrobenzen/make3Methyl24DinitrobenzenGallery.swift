#if DEBUG
func make3Methyl24DinitrobenzenGallery() -> SerializableGalleryRouter {
    let _3Methyl24DinitrobenzenGallery = SerializableGalleryRouter()
    
    _3Methyl24DinitrobenzenGallery.router.register(
        makeMethylbenzene(),
        at: [">", "iw.aotrt.ee.chemicals.3.4.methyl.2.4.dinitrobenzene.methylbenzene"]
    )
    
    _3Methyl24DinitrobenzenGallery.router.register(
        makeDinitro(),
        at: [">", "iw.aotrt.ee.chemicals.3.4.methyl.2.4.dinitrobenzene.dinitro"]
    )
    
    _3Methyl24DinitrobenzenGallery.router.register(
        make3Methyl24Dinitrobenzen(),
        at: [">", "iw.aotrt.ee.chemicals.3.4.methyl.2.4.dinitrobenzene.dinitro"]
    )
    
    return _3Methyl24DinitrobenzenGallery
}
#endif
