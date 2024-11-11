#if DEBUG

import Foundation
import ZTronRouter

func makePolarPeak() -> SerializableGalleryNode {
    let polarImages = ImageRouter()
    
    // MARK: - YETI THRONE
    polarImages.register(
        SerializableImageNode(
            name: "YetiDarkCave",
            description: "IW.SPA.MUS.LT8.polar peak.YetiDarkCave",
            position: 0,
            overlays: [
                SerializableOutlineNode(boundingBox: CGRect(
                    x: 1232.0/2715.0, y: 830.0/1527.0,
                    width: 9.0/2715.0, height: 11.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["YetiDarkCave"]
    )
    
    // MARK: - YETI THRONE ZOOM
    polarImages.register(
        SerializableImageNode(
            name: "YetiDarkCaveZoom",
            description: "IW.SPA.MUS.LT8.polar peak.YetiDarkCave.zoom",
            position: 0,
            overlays: [
                SerializableOutlineNode(boundingBox: CGRect(
                    x: 383.0/1920.0, y: 641.0/1080.0,
                    width: 40.0/1920.0, height: 50.0/1080.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["YetiDarkCave", "zoom"],
        withParameter: SerializableImageNode.NavigationParameters(
            bottomBarIcon: "plus.magnifyingglass",
            boundingFrame: CGRect.NORMALIZED_FULL_SIZE
        )
    )
    
    // MARK: A01 FURNITURE
    polarImages.register(
        SerializableImageNode(
            name: "A01Furniture",
            description: "IW.SPA.MUS.LT8.polar peak.A01Furniture",
            position: 1,
            overlays: [
                SerializableOutlineNode(boundingBox: CGRect(
                    x: 808.0/2715.0, y: 481.0/1527.0,
                    width: 25.0/2715.0, height: 29.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["A01Furniture"]
    )
    
    // MARK: - A01 VEHICLE
    polarImages.register(
        SerializableImageNode(
            name: "A01Vehicle",
            description: "IW.SPA.MUS.LT8.polar peak.A01Vehicle",
            position: 2,
            overlays: [
                SerializableOutlineNode(boundingBox: CGRect(
                    x: 455.0/2715.0, y: 656.0/1527.0,
                    width: 65.0/2715.0, height: 51.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["A01Vehicle"]
    )
    
    // MARK: - YETI ENTRANCE
    polarImages.register(
        SerializableImageNode(
            name: "YetiEntrance",
            description: "IW.SPA.MUS.LT8.polar peak.YetiEntrance",
            position: 3,
            overlays: [
                SerializableOutlineNode(boundingBox: CGRect(
                    x: 1607.0/2715.0, y: 647.0/1527.0,
                    width: 28.0/2715.0, height: 48.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["YetiEntrance"]
    )
    
    // MARK: - ENTRANCE CAVE
    polarImages.register(
        SerializableImageNode(
            name: "EntranceCave",
            description: "IW.SPA.MUS.LT8.polar peak.EntranceCave",
            position: 4,
            overlays: [
                SerializableOutlineNode(boundingBox: CGRect(
                    x: 1759.0/2715.0, y: 643.0/1527.0,
                    width: 33.0/2715.0, height: 27.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["EntranceCave"]
    )
    
    // MARK: - STEEL DRAGON BARRICADE
    polarImages.register(
        SerializableImageNode(
            name: "DragonTrapBarricade",
            description: "IW.SPA.MUS.LT8.polar peak.DragonTrapBarricade",
            position: 5,
            overlays: [
                SerializableOutlineNode(boundingBox: CGRect(
                    x: 1799.0/2715.0, y: 725.0/1527.0,
                    width: 36.0/2715.0, height: 38.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["DragonTrapBarricade"]
    )
    
    // MARK: - PORTAL COOKIES
    polarImages.register(
        SerializableImageNode(
            name: "PortalCookies",
            description: "IW.SPA.MUS.LT8.polar peak.PortalCookies",
            position: 6,
            overlays: [
                SerializableOutlineNode(boundingBox: CGRect(
                    x: 911.0/2715.0, y: 667.0/1527.0,
                    width: 39.0/2715.0, height: 42.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["PortalCookies"]
    )
    
    // MARK: - PORTAL LEDGE
    polarImages.register(
        SerializableImageNode(
            name: "PortalLedge",
            description: "IW.SPA.MUS.LT8.polar peak.PortalLedge",
            position: 7,
            overlays: [
                SerializableOutlineNode(boundingBox: CGRect(
                    x: 1730.0/2715.0, y: 590.0/1527.0,
                    width: 23.0/2715.0, height: 24.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["PortalLedge"]
    )

    // MARK: - COUNTER BARRICADE
    polarImages.register(
        SerializableImageNode(
            name: "CounterBarricade",
            description: "IW.SPA.MUS.LT8.polar peak.CounterBarricade",
            position: 8,
            overlays: [
                SerializableOutlineNode(boundingBox: CGRect(
                    x: 581.0/2715.0, y: 721.0/1527.0,
                    width: 19.0/2715.0, height: 33.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["CounterBarricade"]
    )
    
    // MARK: - TRASHCANS ROLLER C.
    polarImages.register(
        SerializableImageNode(
            name: "Trashcans",
            description: "IW.SPA.MUS.LT8.polar peak.Trashcans",
            position: 9,
            overlays: [
                SerializableOutlineNode(boundingBox: CGRect(
                    x: 1681.0/2715.0, y: 698.0/1527.0,
                    width: 26.0/2715.0, height: 53.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["Trashcans"]
    )
    
    // MARK: - EMPLOYEE OF THE MONTH
    polarImages.register(
        SerializableImageNode(
            name: "RCEmployeeBoth",
            description: "IW.SPA.MUS.LT8.polar peak.RCEmployeeBoth",
            position: 10,
            overlays: [
                SerializableOutlineNode(boundingBox: CGRect(
                    x: 275.0/2715.0, y: 810.0/1527.0,
                    width: 135.0/2715.0, height: 99.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["RCEmployeeBoth"]
    )

    // MARK: - BARRICADE ROLLER C.
    polarImages.register(
        SerializableImageNode(
            name: "RCBarricade",
            description: "IW.SPA.MUS.LT8.polar peak.RCBarricade",
            position: 11,
            overlays: [
                SerializableOutlineNode(boundingBox: CGRect(
                    x: 421.0/2715.0, y: 841.0/1527.0,
                    width: 90.0/2715.0, height: 75.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["RCBarricade"]
    )
    
    // MARK: - HYPERSLOPES CHAIR 1
    polarImages.register(
        SerializableImageNode(
            name: "HyperslopesBoothChair1",
            description: "IW.SPA.MUS.LT8.polar peak.HyperslopesBoothChair1",
            position: 12,
            overlays: [
                SerializableOutlineNode(boundingBox: CGRect(
                    x: 1694.0/2715.0, y: 719.0/1527.0,
                    width: 21.0/2715.0, height: 22.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["HyperslopesBoothChair1"]
    )

    // MARK: - HYPERSLOPES CHAIR 2
    polarImages.register(
        SerializableImageNode(
            name: "HyperslopesBoothChair2",
            description: "IW.SPA.MUS.LT8.polar peak.HyperslopesBoothChair2",
            position: 13,
            overlays: [
                SerializableOutlineNode(boundingBox: CGRect(
                    x: 2096.0/2715.0, y: 663.0/1527.0,
                    width: 109.0/2715.0, height: 80.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["HyperslopesBoothChair2"]
    )
    
    // MARK: - FOUNTAINS
    polarImages.register(
        SerializableImageNode(
            name: "Fountains",
            description: "IW.SPA.MUS.LT8.polar peak.Fountains",
            position: 14,
            overlays: [
                SerializableOutlineNode(boundingBox: CGRect(
                    x: 2069.0/2715.0, y: 711.0/1527.0,
                    width: 25.0/2715.0, height: 31.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["Fountains"]
    )
    
    return SerializableGalleryNode(
        name: "polar peak",
        position: 3,
        assetsImageName: "polar.peak.logo",
        images: polarImages
    )
}
#endif
