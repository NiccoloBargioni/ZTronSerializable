#if DEBUG

func makeOctaHydro2_5_Nitro_3_4_7_ParaZocineGallery() -> SerializableGalleryRouter {
    let octaHydro2_5_Nitro_3_4_7_ParaZocineGallery = SerializableGalleryRouter()
    
    octaHydro2_5_Nitro_3_4_7_ParaZocineGallery.router.register(
        makeFormaldehyde(forPosition: 0, chemicalID: "octa.hydro.2.5.nitro.3.4.7.para.zocine"),
        at: [">", "iw.aotrt.ee.chemicals.octa.hydro.2.5.nitro.3.4.7.para.zocine.formaldehyde"]
    )
    
    octaHydro2_5_Nitro_3_4_7_ParaZocineGallery.router.register(
        makeHexamine(),
        at: [">", "iw.aotrt.ee.chemicals.octa.hydro.2.5.nitro.3.4.7.para.zocine.hexamine"]
    )
    
    octaHydro2_5_Nitro_3_4_7_ParaZocineGallery.router.register(
        makeOctaHydtro2_5Nitro3_4_7ParaZocine(),
        at: [">", "iw.aotrt.ee.chemicals.octa.hydro.2.5.nitro.3.4.7.para.zocine.octa.hydro.2.5.nitro.3.4.7.para.zocine"]
    )

    return octaHydro2_5_Nitro_3_4_7_ParaZocineGallery
}

#endif
