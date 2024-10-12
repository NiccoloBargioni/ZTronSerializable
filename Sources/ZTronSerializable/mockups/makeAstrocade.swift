#if DEBUG

import Foundation
import ZTronRouter

func makeAstrocade() -> SerializableGalleryNode {
    let astrocadeImages = ImageRouter()
    
    // MARK: - CROCODILE TEETH
    astrocadeImages.register(
        SerializableImageNode(
            name: "CrocodileTeeth",
            description: "IW.SPA.MUS.LT8.astrocade.CrocodileTeeth",
            position: 0,
            overlays: [
                SerializableOutlineNode(boundingBox: CGRect(
                    x: 552.0/2714.0, y: 632.0/1526.0,
                    width: 46.0/2714.0, height: 43.0/1526.0
                )),
                
                SerializableBoundingCircleNode()
            ]
        ),
        at: ["CrocodileTeeth"]
    )
    
    // MARK: - CLAW MACHINE
    astrocadeImages.register(
        SerializableImageNode(
            name: "ClawMachine",
            description: "IW.SPA.MUS.LT8.astrocade.ClawMachine",
            position: 1,
            overlays: [
                SerializableOutlineNode(boundingBox: CGRect(
                    x: 670.0/2715.0, y: 737.0/1527.0,
                    width: 164.0/2715.0, height: 53.0/1527.0
                )),
                
                SerializableBoundingCircleNode()
            ]
        ),
        at: ["ClawMachine"]
    )
        
    // MARK: - UFO
    astrocadeImages.register(
        SerializableImageNode(
            name: "UFO",
            description: "IW.SPA.MUS.LT8.astrocade.UFO",
            position: 2,
            overlays: [
                SerializableOutlineNode(boundingBox: CGRect(
                    x: 1370.0/2715.0, y: 636.0/1527.0,
                    width: 21.0/2715.0, height: 18.0/1527.0
                )),
                
                SerializableBoundingCircleNode()
            ]
        ),
        at: ["UFO"]
    )
    
    // MARK: - LAMPPOST
    astrocadeImages.register(
        SerializableImageNode(
            name: "Lamppost",
            description: "IW.SPA.MUS.LT8.astrocade.Lamppost",
            position: 3,
            overlays: [
                SerializableOutlineNode(boundingBox: CGRect(
                    x: 1329.0/2715.0, y: 907.0/1527.0,
                    width: 23.0/2715.0, height: 21.0/1527.0
                )),
                
                SerializableBoundingCircleNode()
            ]
        ),
        at: ["Lamppost"]
    )

    // MARK: - ASTROCADE SIGN
    astrocadeImages.register(
        SerializableImageNode(
            name: "AstrocadeSign",
            description: "IW.SPA.MUS.LT8.astrocade.AstrocadeSign",
            position: 4,
            overlays: [
                SerializableOutlineNode(boundingBox: CGRect(
                    x: 1243.0/2714.0, y: 627.0/1526.0,
                    width: 9.0/2714.0, height: 11.0/1526.0
                )),
                
                SerializableBoundingCircleNode()
            ]
        ),
        at: ["AstrocadeSign"]
    )
    
    return SerializableGalleryNode(
        name: "astrocade",
        position: 2,
        assetsImageName: "astrocade.logo",
        images: astrocadeImages
    )
}

#endif
