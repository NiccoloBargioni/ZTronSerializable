#if DEBUG
import ZTronRouter

func makeAOTRTChemicals() -> SerializableToolNode {
    let chemicalsGalleryRouter = SerializableGalleryRouter()
    
    [
        (make135TeraNytroPhenolGallery(), "iw.aotrt.ee.chemicals.135.tera.nytro.phenol"),
        (make34DiNitroxyMethylPropaneGallery(), "iw.aotrt.ee.chemicals.3.4.dinitroxy.methil.propane"),
        (make3Methyl24DinitrobenzenGallery(), "iw.aotrt.ee.chemicals.3.methil.2.4.dinitrobenzen"),
        (makeOctaHydro2_5_Nitro_3_4_7_ParaZocineGallery(), "iw.aotrt.ee.chemicals.2.5.nitro.3.4.7.parazonice")
    ].forEach { subgalleryRouter, subgalleryFirstPathComponent in
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
