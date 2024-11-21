#if DEBUG

import Foundation
import ZTronRouter

typealias ImageRouter = ZTronRouter<Empty, SerializableImageNode, SerializableImageNode.NavigationParameters>
typealias GalleryRouter = ZTronRouter<Empty, SerializableGalleryNode, Empty>

func makeCosmicWay() -> SerializableGalleryNode {
    let cosmicWayImagesRouter = ImageRouter()
    
    // MARK: - POLICE
    cosmicWayImagesRouter.register(
        SerializableImageNode(
            name: "Police",
            description: "IW.SPA.MUS.LT8.cosmic way.Police.default",
            position: 0,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "Police.outline",
                    boundingBox: CGRect(
                        x: 1317.0/2715.0, y: 745/1527.0,
                        width: 5.0/2715.0, height: 10.0/1527.0
                    )
                ),
                
                SerializableBoundingCircleNode(),
            ]
        ),
        at: [">", "Police"]
    )
    
    // MARK: - POLICE ZOOM
    cosmicWayImagesRouter.register(
        SerializableImageNode(
            name: "PoliceZoom",
            description: "IW.SPA.MUS.LT8.cosmic way.Police.zoom",
            position: 0,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "Police.zoom.outline",
                    boundingBox: CGRect(
                        x: 985.0/1920.0, y: 387.0/1080.0,
                        width: 54.0/1920.0, height: 107.0/1080.0
                    )
                ),
                
                SerializableBoundingCircleNode(),
            ]
        ),
        at: [">", "Police", "zoom"],
        withParameter: SerializableImageNode.NavigationParameters(
            bottomBarIcon: "plus.magnifyingglass",
            boundingFrame: CGRect.NORMALIZED_FULL_SIZE
        )
    )
    
    // MARK: - SHUTTERS
    cosmicWayImagesRouter.register(
        SerializableImageNode(
            name: "Shutters",
            description: "IW.SPA.MUS.LT8.cosmic way.Shutters.default",
            position: 1,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "Shutters.outline",
                    boundingBox: CGRect(
                        x: 790.0/2715.0, y: 767.0/1527.0,
                        width: 23.0/2715.0, height: 43.0/1527.0
                    )
                ),
                
                SerializableBoundingCircleNode(),
            ]
        ),
        at: [">", "Shutters"]
    )

    // MARK: - DEPOT
    cosmicWayImagesRouter.register(
        SerializableImageNode(
            name: "Depot",
            description: "IW.SPA.MUS.LT8.cosmic way.Depot.default",
            position: 2,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "Depot.outline",
                    boundingBox: CGRect(
                        x: 1768.0/2715.0, y: 862.0/1527.0,
                        width: 44.0/2715.0, height: 46.0/1527.0
                    )
                ),
                
                SerializableBoundingCircleNode(),
            ]
        ),
        at: [">", "Depot"]
    )
    
    // MARK: - CAKES
    cosmicWayImagesRouter.register(
        SerializableImageNode(
            name: "Cakes",
            description: "IW.SPA.MUS.LT8.cosmic way.Cakes.default",
            position: 3,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "Cakes.outline",
                    boundingBox: CGRect(
                        x: 1274.0/2715.0, y: 697.0/1527.0,
                        width: 14.0/2715.0, height: 21.0/1527.0
                    )
                ),
                
                SerializableBoundingCircleNode(),
            ]
        ),
        at: [">", "Cakes"]
    )
    
    // MARK: - SPACELAND SIGN
    cosmicWayImagesRouter.register(
        SerializableImageNode(
            name: "SpacelandSign",
            description: "IW.SPA.MUS.LT8.cosmic way.SpacelandSign.default",
            position: 4,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "SpacelandSign.outline",
                    boundingBox: CGRect(
                        x: 1352.0/2715.0, y: 761.0/1527.0,
                        width: 4.0/2715.0, height: 4.0/1527.0
                    )
                ),
                
                SerializableBoundingCircleNode(),
            ]
        ),
        at: [">", "SpacelandSign"]
    )
    
    // MARK: - SPACELAND SIGN ZOOM
    cosmicWayImagesRouter.register(
        SerializableImageNode(
            name: "SpacelandSignZoom",
            description: "IW.SPA.MUS.LT8.cosmic way.SpacelandSign.zoom",
            position: 0,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "SpacelandSign.zoom.outline",
                    boundingBox: CGRect(
                        x: 1288.0/2715.0, y: 568.0/1527.0,
                        width: 11.0/2715.0, height: 10.0/1527.0
                    )
                ),
                
                SerializableBoundingCircleNode(),
            ]
        ),
        at: [">", "SpacelandSign", "zoom"],
        withParameter: SerializableImageNode.NavigationParameters(
            bottomBarIcon: "plus.magnifyingglass",
            boundingFrame: CGRect.NORMALIZED_FULL_SIZE
        )
    )
    
    return SerializableGalleryNode(
        name: "cosmic way",
        position: 0,
        assetsImageName: "cosmic.way.logo",
        images: cosmicWayImagesRouter
    )

}

#endif
