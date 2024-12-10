#if DEBUG

import Foundation
import ZTronRouter

func makeAstrocade() -> SerializableGalleryNode {
    let astrocadeImages = ImageRouter()
    
    // MARK: - CROCODILE TEETH
    astrocadeImages.register(
        SerializableImageNode(
            name: "crocodile.teeth.shelf.teddy",
            description: "IW.SPA.MUS.LT8.astrocade.crocodile.teeth.shelf.teddy.caption",
            position: 0,
            searchLabel: "IW.SPA.MUS.LT8.astrocade.crocodile.teeth.shelf.teddy.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "crocodile.teeth.shelf.teddy.outline",
                    boundingBox: CGRect(
                    x: 552.0/2714.0, y: 632.0/1526.0,
                    width: 46.0/2714.0, height: 43.0/1526.0
                )),
                
                SerializableBoundingCircleNode()
            ]
        ),
        at: ["crocodile.teeth.shelf.teddy"]
    )
    
    // MARK: - CLAW MACHINE
    astrocadeImages.register(
        SerializableImageNode(
            name: "astrocade.claw.machine.teddy.bear",
            description: "IW.SPA.MUS.LT8.astrocade.astrocade.claw.machine.teddy.bear.caption",
            position: 1,
            searchLabel: "IW.SPA.MUS.LT8.astrocade.astrocade.claw.machine.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "astrocade.claw.machine.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 670.0/2715.0, y: 737.0/1527.0,
                    width: 164.0/2715.0, height: 53.0/1527.0
                )),
                
                SerializableBoundingCircleNode()
            ]
        ),
        at: ["astrocade.claw.machine.teddy.bear"]
    )
        
    // MARK: - UFO
    astrocadeImages.register(
        SerializableImageNode(
            name: "astrocade.ufo.ceiling.teddy.bear",
            description: "IW.SPA.MUS.LT8.astrocade.astrocade.ufo.ceiling.teddy.bear.caption",
            position: 2,
            searchLabel: "IW.SPA.MUS.LT8.astrocade.astrocade.ufo.ceiling.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "astrocade.ufo.ceiling.teddy.outline",
                    boundingBox: CGRect(
                    x: 1370.0/2715.0, y: 636.0/1527.0,
                    width: 21.0/2715.0, height: 18.0/1527.0
                )),
                
                SerializableBoundingCircleNode()
            ]
        ),
        at: ["astrocade.ufo.ceiling.teddy.bear"]
    )
    
    // MARK: - LAMPPOST
    astrocadeImages.register(
        SerializableImageNode(
            name: "astrocade.entrance.lamppost.from.journey.teddy.bear",
            description: "IW.SPA.MUS.LT8.astrocade.astrocade.entrance.lamppost.from.journey.teddy.bear.caption",
            position: 3,
            searchLabel: "IW.SPA.MUS.LT8.astrocade.astrocade.entrance.lamppost.from.journey.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "astrocade.entrance.lamppost.from.journey.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1329.0/2715.0, y: 907.0/1527.0,
                    width: 23.0/2715.0, height: 21.0/1527.0
                )),
                
                SerializableBoundingCircleNode()
            ]
        ),
        at: ["astrocade.entrance.lamppost.from.journey.teddy.bear"]
    )

    // MARK: - ASTROCADE SIGN
    astrocadeImages.register(
        SerializableImageNode(
            name: "astrocade.rooftop.from.journey.teddy.bear",
            description: "IW.SPA.MUS.LT8.astrocade.astrocade.rooftop.from.journey.teddy.bear.caption",
            position: 4,
            searchLabel: "IW.SPA.MUS.LT8.astrocade.astrocade.rooftop.from.journey.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "astrocade.rooftop.from.journey.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1243.0/2714.0, y: 627.0/1526.0,
                    width: 9.0/2714.0, height: 11.0/1526.0
                )),
                
                SerializableBoundingCircleNode()
            ]
        ),
        at: ["astrocade.rooftop.from.journey.teddy.bear"]
    )
    
    return SerializableGalleryNode(
        name: "astrocade",
        position: 2,
        assetsImageName: "astrocade.logo",
        images: astrocadeImages
    )
}

#endif
