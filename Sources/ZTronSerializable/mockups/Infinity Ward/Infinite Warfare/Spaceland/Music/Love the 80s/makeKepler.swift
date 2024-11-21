#if DEBUG

import Foundation
import ZTronRouter

func makeKepler() -> SerializableGalleryNode {
    let kepler = ImageRouter()
    
    // MARK: - FOUNTAINS LAMP
    kepler.register(
        SerializableImageNode(
            name: "ChromosphereLampFar",
            description: "IW.SPA.MUS.LT8.kepler.ChromosphereLampFar",
            position: 0,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "ChromosphereLampFar.outline",
                    boundingBox: CGRect(
                    x: 2234.0/2715.0, y: 462.0/1527.0,
                    width: 13.0/2715.0, height: 26.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["ChromosphereLampFar"]
    )
    
    // MARK: - FOUNTAINS LAMP ZOOM
    kepler.register(
        SerializableImageNode(
            name: "ChromosphereLampFarZoom",
            description: "IW.SPA.MUS.LT8.kepler.ChromosphereLampFar.zoom",
            position: 0,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "ChromosphereLampFar.zoom.outline",
                    boundingBox: CGRect(
                    x: 1290.0/2715.0, y: 675.0/1527.0,
                    width: 30.0/2715.0, height: 35.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["ChromosphereLampFar", "zoom"],
        withParameter: SerializableImageNode.NavigationParameters(
            bottomBarIcon: "plus.magnifyingglass",
            boundingFrame: CGRect.NORMALIZED_FULL_SIZE
        )
    )
    
    // MARK: - CHROMOSPHERE LAMP
    kepler.register(
        SerializableImageNode(
            name: "ChromosphereLamp",
            description: "IW.SPA.MUS.LT8.kepler.ChromosphereLamp",
            position: 1,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "ChromosphereLamp.outline",
                    boundingBox: CGRect(
                    x: 1337.0/2715.0, y: 753.0/1527.0,
                    width: 9.0/2715.0, height: 13.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["ChromosphereLamp"]
    )
    
    // MARK: - CONE LORD
    kepler.register(
        SerializableImageNode(
            name: "ConeLord",
            description: "IW.SPA.MUS.LT8.kepler.ConeLord",
            position: 2,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "ConeLord.outline",
                    boundingBox: CGRect(
                    x: 1859.0/2715.0, y: 732.0/1527.0,
                    width: 28.0/2715.0, height: 27.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["ConeLord"]
    )
    
    // MARK: - DJ BOOTH
    kepler.register(
        SerializableImageNode(
            name: "DJBooth",
            description: "IW.SPA.MUS.LT8.kepler.DJBooth",
            position: 3,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "DJBooth.outline",
                    boundingBox: CGRect(
                    x: 1470.0/2715.0, y: 730.0/1527.0,
                    width: 25.0/2715.0, height: 32.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["DJBooth"]
    )
   
    // MARK: - DJ BOOTH ZOOM
    kepler.register(
        SerializableImageNode(
            name: "DJBoothZoom",
            description: "IW.SPA.MUS.LT8.kepler.DJBooth.zoom",
            position: 0,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "DJBooth.zoom.outline",
                    boundingBox: CGRect(
                    x: 1197.0/2715.0, y: 770.0/1527.0,
                    width: 122.0/2715.0, height: 137.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["DJBooth", "zoom"],
        withParameter: SerializableImageNode.NavigationParameters(
            bottomBarIcon: "plus.magnifyingglass",
            boundingFrame: CGRect.NORMALIZED_FULL_SIZE
        )
    )
    
    // MARK: - OCTONIAN HUNTER
    kepler.register(
        SerializableImageNode(
            name: "OctonianHunter",
            description: "IW.SPA.MUS.LT8.kepler.OctonianHunter",
            position: 4,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "OctonianHunter.outline",
                    boundingBox: CGRect(
                    x: 1229.0/2715.0, y: 842.0/1527.0,
                    width: 21.0/2715.0, height: 23.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["OctonianHunter"]
    )
    
    // MARK: - CROCODILE TRAP
    kepler.register(
        SerializableImageNode(
            name: "SpaceChomp",
            description: "IW.SPA.MUS.LT8.kepler.SpaceChomp",
            position: 5,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "SpaceChomp.outline",
                    boundingBox: CGRect(
                    x: 1439.0/2715.0, y: 728.0/1527.0,
                    width: 8.0/2715.0, height: 7.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["SpaceChomp"]
    )
    
    return SerializableGalleryNode(
        name: "kepler",
        position: 4,
        assetsImageName: "kepler.logo",
        images: kepler
    )
}

#endif
