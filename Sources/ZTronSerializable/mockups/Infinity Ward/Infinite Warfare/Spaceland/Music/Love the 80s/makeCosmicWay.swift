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
            name: "spawn.police.from.power.room.barrier.teddy.bear",
            description: "IW.SPA.MUS.LT8.cosmic way.spawn.police.from.power.room.barrier.teddy.bear.caption",
            position: 0,
            searchLabel: "IW.SPA.MUS.LT8.cosmic way.spawn.police.from.power.room.barrier.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "spawn.police.from.power.room.barrier.teddy.bear.outline",
                    boundingBox: CGRect(
                        x: 1317.0/2715.0, y: 745/1527.0,
                        width: 5.0/2715.0, height: 10.0/1527.0
                    )
                ),
                
                SerializableBoundingCircleNode(),
            ]
        ),
        at: [">", "spawn.police.from.power.room.barrier.teddy.bear"]
    )
    
    // MARK: - POLICE ZOOM
    cosmicWayImagesRouter.register(
        SerializableImageNode(
            name: "spawn.police.from.power.room.barrier.teddy.bear.zoom",
            description: "IW.SPA.MUS.LT8.cosmic way.spawn.police.from.power.room.barrier.teddy.bear.caption",
            position: 0,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "spawn.police.from.power.room.barrier.teddy.bear.zoom.outline",
                    boundingBox: CGRect(
                        x: 985.0/1920.0, y: 387.0/1080.0,
                        width: 54.0/1920.0, height: 107.0/1080.0
                    )
                ),
                
                SerializableBoundingCircleNode(),
            ]
        ),
        at: [">", "spawn.police.from.power.room.barrier.teddy.bear", "zoom"],
        withParameter: SerializableImageNode.NavigationParameters(
            bottomBarIcon: "plus.magnifyingglass",
            goBackBottomBarIcon: "minus.magnifyingglass",
            boundingFrame: CGRect.NORMALIZED_FULL_SIZE
        )
    )
    
    // MARK: - SHUTTERS
    cosmicWayImagesRouter.register(
        SerializableImageNode(
            name: "spawm.behind.shutters.teddy.bear",
            description: "IW.SPA.MUS.LT8.cosmic way.spawm.behind.shutters.teddy.bear.caption",
            position: 1,
            searchLabel: "IW.SPA.MUS.LT8.cosmic way.spawm.behind.shutters.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "spawm.behind.shutters.teddy.bear.outline",
                    boundingBox: CGRect(
                        x: 790.0/2715.0, y: 767.0/1527.0,
                        width: 23.0/2715.0, height: 43.0/1527.0
                    )
                ),
                
                SerializableBoundingCircleNode(),
            ]
        ),
        at: [">", "spawm.behind.shutters.teddy.bear"]
    )

    // MARK: - DEPOT
    cosmicWayImagesRouter.register(
        SerializableImageNode(
            name: "cosmic.way.banshee.wallbuy.depot.teddy.bear.search.label",
            description: "IW.SPA.MUS.LT8.cosmic way.cosmic.way.banshee.wallbuy.depot.teddy.bear.caption",
            position: 2,
            searchLabel: "IW.SPA.MUS.LT8.cosmic way.cosmic.way.banshee.wallbuy.depot.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "cosmic.way.banshee.wallbuy.depot.teddy.bear.outline",
                    boundingBox: CGRect(
                        x: 1768.0/2715.0, y: 862.0/1527.0,
                        width: 44.0/2715.0, height: 46.0/1527.0
                    )
                ),
                
                SerializableBoundingCircleNode(),
            ]
        ),
        at: [">", "cosmic.way.banshee.wallbuy.depot.teddy.bear"]
    )
    
    // MARK: - CAKES
    cosmicWayImagesRouter.register(
        SerializableImageNode(
            name: "cosmic.way.crater.cakes.coin.machine.journey.door.teddy.bear",
            description: "IW.SPA.MUS.LT8.cosmic way.cosmic.way.crater.cakes.coin.machine.journey.door.teddy.bear.caption",
            position: 3,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "cosmic.way.crater.cakes.coin.machine.journey.door.teddy.bear.outline",
                    boundingBox: CGRect(
                        x: 1274.0/2715.0, y: 697.0/1527.0,
                        width: 14.0/2715.0, height: 21.0/1527.0
                    )
                ),
                
                SerializableBoundingCircleNode(),
            ]
        ),
        at: [">", "cosmic.way.crater.cakes.coin.machine.journey.door.teddy.bear"]
    )
    
    // MARK: - SPACELAND SIGN
    cosmicWayImagesRouter.register(
        SerializableImageNode(
            name: "spaceland.sign.top.above.l.teddy.bear",
            description: "IW.SPA.MUS.LT8.cosmic way.spaceland.sign.top.above.l.teddy.bear.caption",
            position: 4,
            searchLabel: "IW.SPA.MUS.LT8.cosmic way.spaceland.sign.top.above.l.teddy.bear.searchLabel",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "spaceland.sign.top.above.l.teddy.bear.outline",
                    boundingBox: CGRect(
                        x: 1352.0/2715.0, y: 761.0/1527.0,
                        width: 4.0/2715.0, height: 4.0/1527.0
                    )
                ),
                
                SerializableBoundingCircleNode(),
            ]
        ),
        at: [">", "spaceland.sign.top.above.l.teddy.bear"]
    )
    
    // MARK: - SPACELAND SIGN ZOOM
    cosmicWayImagesRouter.register(
        SerializableImageNode(
            name: "spaceland.sign.top.above.l.teddy.bear.zoom",
            description: "IW.SPA.MUS.LT8.cosmic way.spaceland.sign.top.above.l.teddy.bear.caption",
            position: 0,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "spaceland.sign.top.above.l.teddy.bear.zoom.outline",
                    boundingBox: CGRect(
                        x: 1288.0/2715.0, y: 568.0/1527.0,
                        width: 11.0/2715.0, height: 10.0/1527.0
                    )
                ),
                
                SerializableBoundingCircleNode(),
            ]
        ),
        at: [">", "spaceland.sign.top.above.l.teddy.bear", "zoom"],
        withParameter: SerializableImageNode.NavigationParameters(
            bottomBarIcon: "plus.magnifyingglass",
            goBackBottomBarIcon: "minus.magnifyingglass",
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
