#if DEBUG
import ZTronRouter

func makeAOTRTChemicals() -> SerializableToolNode {
    let chemicalsGalleryRouter = SerializableGalleryRouter()
    
    [
        (make135TeraNytroPhenolGallery(), "iw.aotrt.ee.chemicals.135.tera.nytro.phenol", 0),
        (make34DiNitroxyMethylPropaneGallery(), "iw.aotrt.ee.chemicals.3.4.dinitroxy.methil.propane", 1),
        (make3Methyl24DinitrobenzenGallery(), "iw.aotrt.ee.chemicals.3.methil.2.4.dinitrobenzen", 2),
        (makeOctaHydro2_5_Nitro_3_4_7_ParaZocineGallery(), "iw.aotrt.ee.chemicals.2.5.nitro.3.4.7.parazonice", 3)
    ].forEach { subgalleryRouter, subgalleryFirstPathComponent, subgalleryPosition in
        chemicalsGalleryRouter.router.register(
            SerializableGalleryNode(
                name: subgalleryFirstPathComponent,
                position: subgalleryPosition,
                assetsImageName: "chemicals.logo",
                images: ImageRouter()
            ), at: [">", subgalleryFirstPathComponent]
        )
        
        subgalleryRouter.router.forEach { absolutePath, output in
            chemicalsGalleryRouter.router.register(
                output,
                at: [">", subgalleryFirstPathComponent].appending(contentsOf: Array.array(subsequence: absolutePath.dropFirst()))
            )
        }
    }
    
    return .init(
        name: "iw.aotrt.ee.chemicals.tool.name",
        position: 0,
        assetsImageName: "chemicals.logo",
        galleryRouter: chemicalsGalleryRouter
    )
}
#endif
