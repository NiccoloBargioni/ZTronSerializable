#if DEBUG

import Foundation
import ZTronRouter

func makeJourneyIntoSpace() -> SerializableGalleryNode {
    let journeyImages = ImageRouter()
        
    // MARK: - MOONSHAKES TERRACE
    journeyImages.register(SerializableImageNode(
        name: "MoonShakesTerrace",
        description: "IW.SPA.MUS.LT8.journey into space.MoonShakesTerrace",
        position: 0,
        overlays: [
            SerializableOutlineNode(boundingBox: CGRect(
                x: 1158.0/2715.0, y: 678.0/1527.0,
                width: 20.0/2715.0, height: 35.0/1527.0
            )),
            SerializableBoundingCircleNode()
        ]
    ), at: ["MoonShakesTerrace"])
    
    
    // MARK: - MOONSHAKES LOCATION 2
    journeyImages.register(SerializableImageNode(
        name: "MoonShakes",
        description: "IW.SPA.MUS.LT8.journey into space.MoonShakes",
        position: 1,
        overlays: [
            SerializableOutlineNode(boundingBox: CGRect(
                x: 2247.0/2714.0, y: 617.0/1526.0,
                width: 94.0/2714.0, height: 85.0/1526.0
            )),
            SerializableBoundingCircleNode()
        ]
    ), at: ["MoonShakes"])
    
    // MARK: - MOONSHAKES TOILET
    journeyImages.register(SerializableImageNode(
        name: "MoonShakesToilet",
        description: "IW.SPA.MUS.LT8.journey into space.MoonShakesToilet",
        position: 2,
        overlays: [
            SerializableOutlineNode(boundingBox: CGRect(
                x: 367.0/2715.0, y: 905.0/1527.0,
                width: 74.0/2715.0, height: 107.0/1527.0
            )),
            SerializableBoundingCircleNode()
        ]
    ), at: ["MoonShakesToilet"])
    
    // MARK: - TUFF 'NUFF TOILET
    journeyImages.register(SerializableImageNode(
        name: "JuggToilet",
        description: "IW.SPA.MUS.LT8.journey into space.JuggToilet",
        position: 3,
        overlays: [
            SerializableOutlineNode(boundingBox: CGRect(
                x: 572.0/2715.0, y: 685.0/1527.0,
                width: 46.0/2715.0, height: 62.0/1527.0
            )),
            SerializableBoundingCircleNode()
        ]
    ), at: ["JuggToilet"])

    // MARK: - BUMPER CARS
    journeyImages.register(SerializableImageNode(
        name: "BumperCars",
        description: "IW.SPA.MUS.LT8.journey into space.BumperCars",
        position: 4,
        overlays: [
            SerializableOutlineNode(boundingBox: CGRect(
                x: 165.0/2715.0, y: 683.0/1527.0,
                width: 77.0/2715.0, height: 55.0/1527.0
            )),
            SerializableBoundingCircleNode()
        ]
    ), at: ["BumperCars"])
    
    // MARK: - ASTRONAUT CUTOUT
    journeyImages.register(SerializableImageNode(
        name: "AstronautLegs",
        description: "IW.SPA.MUS.LT8.journey into space.AstronautLegs",
        position: 5,
        overlays: [
            SerializableOutlineNode(boundingBox: CGRect(
                x: 1130.0/2715.0, y: 736.0/1527.0,
                width: 16.0/2715.0, height: 15.0/1527.0
            )),
            SerializableBoundingCircleNode()
        ]
    ), at: ["AstronautLegs"])

    // MARK: - BLUE BOLTS
    journeyImages.register(SerializableImageNode(
        name: "BlueBolts",
        description: "IW.SPA.MUS.LT8.journey into space.BlueBolts",
        position: 6,
        overlays: [
            SerializableOutlineNode(boundingBox: CGRect(
                x: 1065.0/2715.0, y: 802.0/1527.0,
                width: 13.0/2715.0, height: 19.0/1527.0
            )),
            SerializableBoundingCircleNode()
        ]
    ), at: ["BlueBolts"])
        
    return SerializableGalleryNode(
        name: "journey into space",
        position: 1,
        assetsImageName: "journey.into.space.logo",
        images: journeyImages
    )
}

#endif
