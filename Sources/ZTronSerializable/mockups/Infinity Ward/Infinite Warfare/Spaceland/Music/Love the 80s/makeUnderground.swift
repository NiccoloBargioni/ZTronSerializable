#if DEBUG

import Foundation
import ZTronRouter

func makeUnderground() -> SerializableGalleryNode {
    let underground = ImageRouter()
    
    // MARK: - UTILITY ROOM FOUNTAINS
    underground.register(
        SerializableImageNode(
            name: "FountainsUtilityRoom",
            description: "IW.SPA.MUS.LT8.underground.FountainsUtilityRoom",
            position: 0,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "FountainsUtilityRoom.outline",
                    boundingBox: CGRect(
                    x: 1248.0/2715.0, y: 934.0/1527.0,
                    width: 37.0/2715.0, height: 51.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["FountainsUtilityRoom"]
    )
    
    // MARK: DOCUMENTS SHREDDER
    underground.register(
        SerializableImageNode(
            name: "ShredderDocuments",
            description: "IW.SPA.MUS.LT8.underground.ShredderDocuments",
            position: 1,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "ShredderDocuments.outline",
                    boundingBox: CGRect(
                    x: 1551.0/2715.0, y: 847.0/1527.0,
                    width: 24.0/2715.0, height: 41.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["ShredderDocuments"]
    )
    
    // MARK: - SHELF NEAR SHREDDER
    underground.register(
        SerializableImageNode(
            name: "ShredderShelf",
            description: "IW.SPA.MUS.LT8.underground.ShredderShelf",
            position: 2,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "ShredderShelf.outline",
                    boundingBox: CGRect(
                    x: 1063.0/2715.0, y: 663.0/1527.0,
                    width: 36.0/2715.0, height: 39.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["ShredderShelf"]
    )
    
    // MARK: - ALIEN SHUTTER
    underground.register(
        SerializableImageNode(
            name: "AlienShutter",
            description: "IW.SPA.MUS.LT8.underground.AlienShutter",
            position: 3,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "AlienShutter.outline",
                    boundingBox: CGRect(
                    x: 1030.0/2715.0, y: 776.0/1527.0,
                    width: 28.0/2715.0, height: 17.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["AlienShutter"]
    )

    // MARK: - EMPLOYEES ONLY CHAIR
    underground.register(
        SerializableImageNode(
            name: "EmployeesOnlyChair",
            description: "IW.SPA.MUS.LT8.underground.EmployeesOnlyChair",
            position: 4,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "EmployeesOnlyChair.outline",
                    boundingBox: CGRect(
                    x: 330.0/2715.0, y: 823.0/1527.0,
                    width: 130.0/2715.0, height: 107.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["EmployeesOnlyChair"]
    )
    
    // MARK: - EMPLOYEES ONLY DESK
    underground.register(
        SerializableImageNode(
            name: "EmployeesOnlyDesk",
            description: "IW.SPA.MUS.LT8.underground.EmployeesOnlyDesk",
            position: 5,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "EmployeesOnlyChair.outline",
                    boundingBox: CGRect(
                    x: 47.0/2715.0, y: 829.0/1527.0,
                    width: 129.0/2715.0, height: 94.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["EmployeesOnlyChair"]
    )
    
    // MARK: - JUNK MURALES
    underground.register(
        SerializableImageNode(
            name: "JunkMurales",
            description: "IW.SPA.MUS.LT8.underground.JunkMurales",
            position: 6,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "JunkMurales.outline",
                    boundingBox: CGRect(
                    x: 2122.0/2714.0, y: 748.0/1526.0,
                    width: 74.0/2714.0, height: 44.0/1526.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["JunkMurales"]
    )
    
    // MARK: - RED PIPE
    underground.register(
        SerializableImageNode(
            name: "RedPipes",
            description: "IW.SPA.MUS.LT8.underground.RedPipes",
            position: 7,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "RedPipes.outline",
                    boundingBox: CGRect(
                    x: 1320.0/2715.0, y: 559.0/1527.0,
                    width: 22.0/2715.0, height: 26.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["RedPipes"]
    )
    
    // MARK: - RACING STRIPES
    underground.register(
        SerializableImageNode(
            name: "EmployeesOnlyRacing",
            description: "IW.SPA.MUS.LT8.underground.EmployeesOnlyRacing",
            position: 8,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "EmployeesOnlyRacing.outline",
                    boundingBox: CGRect(
                    x: 1105.0/2715.0, y: 849.0/1527.0,
                    width: 18.0/2715.0, height: 88.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["EmployeesOnlyRacing"]
    )
    
    // MARK: - YETI SHUTTER
    underground.register(
        SerializableImageNode(
            name: "YetiShutter",
            description: "IW.SPA.MUS.LT8.underground.YetiShutter",
            position: 9,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "YetiShutter.outline",
                    boundingBox: CGRect(
                    x: 1353.0/2715.0, y: 737.0/1527.0,
                    width: 16.0/2715.0, height: 24.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["YetiShutter"]
    )
    
    // MARK: - YETI SHUTTER ZOOM
    underground.register(
        SerializableImageNode(
            name: "YetiShutterZoom",
            description: "IW.SPA.MUS.LT8.underground.YetiShutter.zoom",
            position: 0,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "YetiShutter.zoom.outline",
                    boundingBox: CGRect(
                    x: 1191.0/2715.0, y: 614.0/1527.0,
                    width: 95.0/2715.0, height: 119.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["YetiShutter", "zoom"],
        withParameter: SerializableImageNode.NavigationParameters(
            bottomBarIcon: "plus.magnifyingglass",
            boundingFrame: CGRect.NORMALIZED_FULL_SIZE
        )
    )
    
    // MARK: - RACING STRIPES LADDER
    underground.register(
        SerializableImageNode(
            name: "RacingLadder",
            description: "IW.SPA.MUS.LT8.underground.RacingLadder",
            position: 10,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "RacingLadder.outline",
                    boundingBox: CGRect(
                    x: 571.0/2715.0, y: 471.0/1527.0,
                    width: 44.0/2715.0, height: 50.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["RacingLadder"]
    )
    
    // MARK: - HALLWAY CEILING
    underground.register(
        SerializableImageNode(
            name: "HallwayCeiling",
            description: "IW.SPA.MUS.LT8.underground.HallwayCeiling",
            position: 11,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "HallwayCeiling.outline",
                    boundingBox: CGRect(
                    x: 1099.0/2715.0, y: 683.0/1527.0,
                    width: 33.0/2715.0, height: 25.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["HallwayCeiling"]
    )
    
    // MARK: - ASTRONAUT CUTOUT
    underground.register(
        SerializableImageNode(
            name: "AstronoutCutout",
            description: "IW.SPA.MUS.LT8.underground.AstronoutCutout",
            position: 12,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "AstronoutCutout.outline",
                    boundingBox: CGRect(
                    x: 1308.0/2715.0, y: 652.0/1527.0,
                    width: 23.0/2715.0, height: 50.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["AstronoutCutout"]
    )
    
    // MARK: - ARCADE SHUTTER
    underground.register(
        SerializableImageNode(
            name: "ArcadeShutter",
            description: "IW.SPA.MUS.LT8.underground.ArcadeShutter",
            position: 13,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "ArcadeShutter.outline",
                    boundingBox: CGRect(
                    x: 790.0/2715.0, y: 767.0/1527.0,
                    width: 23.0/2715.0, height: 43.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["ArcadeShutter"]
    )
    
    return SerializableGalleryNode(
        name: "underground",
        position: 5,
        assetsImageName: "underground.logo",
        images: underground
    )
}

#endif
