#if DEBUG
import LoremIpsum

public func makeSkullhopStep1() -> SerializableGalleryRouter {
    let skullLocations = ImageRouter.init()
    
    skullLocations.register(
        SerializableImageNode(
            name: "power.building.barrier.skull",
            description: "IW.aotrt.skullhop.step1.power.building.barrier.skull.caption",
            position: 0,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "IW.aotrt.skullhop.step1.power.building.barrier.skull.outline",
                    boundingBox: .init(
                        x: 2275.0/2715.0,
                        y: 824.0/1527.0,
                        width: 33.0/2715.0,
                        height: 33.0/1527.0
                    )
                )
            ]
        ), at: [">", "power.building.barrier.skull"]
    )
    
    skullLocations.register(
        SerializableImageNode(
            name: "spawn.dumpster.portal.skull",
            description: "IW.aotrt.skullhop.step1.spawn.dumpster.portal.skull.caption",
            position: 1,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "spawn.dumpster.portal.skull.outline",
                    boundingBox: .init(
                        x: 451.0/2715.0,
                        y: 1421.0/1527.0,
                        width: 82.0/2715.0,
                        height: 77.0/1527.0
                    )
                )
            ]
        ), at: [">", "spawn.dumpster.portal.skull"]
    )
    
    skullLocations.register(
        SerializableImageNode(
            name: "beachside.market.under.shelf.skull",
            description: "IW.aotrt.skullhop.step1.beachside.market.under.shelf.skull.caption",
            position: 2,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "beachside.market.under.shelf.skull.outline",
                    boundingBox: .init(
                        x: 1125.0/2715.0,
                        y: 660.0/1527.0,
                        width: 80.0/2715.0,
                        height: 14.0/1527.0
                    )
                )
            ]
        ), at: [">", "beachside.market.under.shelf.skull"]
    )
    
    skullLocations.register(
        SerializableImageNode(
            name: "under.bus.to.motel.skull",
            description: "IW.aotrt.skullhop.step1.under.bus.to.motel.skull.caption",
            position: 3,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "under.bus.to.motel.skull.outline",
                    boundingBox: .init(
                        x: 1264.0/2715.0,
                        y: 742.0/1527.0,
                        width: 7.0/2715.0,
                        height: 13.0/1527.0
                    )
                )
            ]
        ), at: [">", "under.bus.to.motel.skull"]
    )
    
    skullLocations.register(
        SerializableImageNode(
            name: "sign.outside.beachside.market.skull",
            description: "IW.aotrt.skullhop.step1.sign.outside.beachside.market.skull.caption",
            position: 4,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "sign.outside.beachside.market.skull.outline",
                    boundingBox: .init(
                        x: 1301.0/2715.0,
                        y: 774.0/1527.0,
                        width: 2.0/2715.0,
                        height: 4.0/1527.0
                    )
                )
            ]
        ), at: [">", "sign.outside.beachside.market.skull"]
    )
    
    skullLocations.register(
        SerializableImageNode(
            name: "sign.outside.beachside.market.skull.zoom",
            description: "IW.aotrt.skullhop.step1.sign.outside.beachside.market.skull.caption",
            position: 0,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "sign.outside.beachside.market.skull.zoom.outline",
                    boundingBox: .init(
                        x: 1301.0/2715.0,
                        y: 774.0/1527.0,
                        width: 2.0/2715.0,
                        height: 4.0/1527.0
                    )
                )
            ]
        ), at: [">", "sign.outside.beachside.market.skull", "zoom"],
        withParameter: .init(
            bottomBarIcon: "plus.magnifyingglass",
            goBackBottomBarIcon: "minus.magnifyingglass",
            boundingFrame: .init(
                origin: .init(x: 1147.0/2715.0, y: 656.0/1527.0),
                size: .init(width: (182.0 * 16.0/9.0)/2715.0, height: 182.0/1527.0)
            )
        )
    )
    
    skullLocations.register(
        SerializableImageNode(
            name: "dumpster.right.gas.station.skull",
            description: "IW.aotrt.skullhop.step1.dumpster.right.gas.station.skull.caption",
            position: 5,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "dumpster.right.gas.station.skull.outline",
                    boundingBox: .init(
                        x: 1340.0/2715.0,
                        y: 761.0/1527.0,
                        width: 4.0/2715.0,
                        height: 3.0/1527.0
                    )
                )
            ]
        ), at: [">", "dumpster.right.gas.station.skull"]
    )
    
    
    skullLocations.register(
        SerializableImageNode(
            name: "dumpster.right.gas.station.skull.zoom",
            description: "IW.aotrt.skullhop.step1.dumpster.right.gas.station.skull.caption",
            position: 0,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "dumpster.right.gas.station.skull.zoom.outline",
                    boundingBox: .init(
                        x: 1356.0/2715.0,
                        y: 739.0/1527.0,
                        width: 16.0/2715.0,
                        height: 33.0/1527.0
                    )
                )
            ]
        ), at: [">", "dumpster.right.gas.station.skull", "zoom"],
        withParameter: .init(
            bottomBarIcon: "plus.magnifyingglass",
            goBackBottomBarIcon: "minus.magnifyingglass",
            boundingFrame: .init(
                origin: .init(x: 1131.0/2715.0, y: 646.0/1527.0),
                size: .init(width: 415.0/2715.0, height: (415.0*9.0/16.0)/1527.0)
            )
        )
    )
    
    skullLocations.register(
        SerializableImageNode(
            name: "cliff.near.radioactive.thing.skull",
            description: "IW.aotrt.skullhop.step1.cliff.near.radioactive.thing.skull.caption",
            position: 6,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "cliff.near.radioactive.thing.skull.outline",
                    boundingBox: .init(
                        x: 1345.0/2715.0,
                        y: 756.0/1527.0,
                        width: 2.0/2715.0,
                        height: 2.0/1527.0
                    )
                )
            ]
        ), at: [">", "cliff.near.radioactive.thing.skull"]
    )
    
    skullLocations.register(
        SerializableImageNode(
            name: "cliff.near.radioactive.thing.skull.zoom",
            description: "IW.aotrt.skullhop.step1.cliff.near.radioactive.thing.skull.caption",
            position: 0,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "cliff.near.radioactive.thing.skull.zoom.outline",
                    boundingBox: .init(
                        x: 1462.0/2715.0,
                        y: 784.0/1527.0,
                        width: 26.0/2715.0,
                        height: 28.0/1527.0
                    )
                )
            ]
        ), at: [">", "cliff.near.radioactive.thing.skull", "zoom"],
        withParameter: .init(
            bottomBarIcon: "plus.magnifyingglass",
            goBackBottomBarIcon: "minus.magnifyingglass",
            boundingFrame: .init(
                origin: .init(x: 1234.0/2715.0, y: 696.0/1527.0),
                size: .init(width: (116.0*16.0/9.0)/2715.0, height: 116.0/1527.0)
            )
        )
    )
    
    
    skullLocations.register(
        SerializableImageNode(
            name: "motel.last.floor.beach.skull",
            description: "IW.aotrt.skullhop.step1.motel.last.floor.beach.skull.caption",
            position: 7,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "motel.last.floor.beach.skull.outline",
                    boundingBox: .init(
                        x: 1182.0/2715.0,
                        y: 698.0/1527.0,
                        width: 4.0/2715.0,
                        height: 4.0/1527.0
                    )
                )
            ]
        ), at: [">", "motel.last.floor.beach.skull"]
    )
    
    
    skullLocations.register(
        SerializableImageNode(
            name: "motel.last.floor.beach.skull.zoom",
            description: "IW.aotrt.skullhop.step1.cliff.near.radioactive.thing.skull.caption",
            position: 0,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "motel.last.floor.beach.skull.zoom.outline",
                    boundingBox: .init(
                        x: 1334.0/2715.0,
                        y: 738.0/1527.0,
                        width: 18.0/2715.0,
                        height: 17.0/1527.0
                    )
                )
            ]
        ), at: [">", "motel.last.floor.beach.skull", "zoom"],
        withParameter: .init(
            bottomBarIcon: "plus.magnifyingglass",
            goBackBottomBarIcon: "minus.magnifyingglass",
            boundingFrame: .init(
                origin: .init(x: 828.0/2715.0, y: 503.0/1527.0),
                size: .init(width: (405.0*16.0/9.0)/2715.0, height: 405.0/1527.0)
            )
        )
    )
    
    
    skullLocations.register(
        SerializableImageNode(
            name: "elvira.tv.studio.barrier.skull",
            description: "IW.aotrt.skullhop.step1.elvira.tv.studio.barrier.skull.caption",
            position: 8,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "elvira.tv.studio.barrier.skull.outline",
                    boundingBox: .init(
                        x: 1558.0/2715.0,
                        y: 760.0/1527.0,
                        width: 90.0/2715.0,
                        height: 68.0/1527.0
                    )
                )
            ]
        ), at: [">", "elvira.tv.studio.barrier.skull"]
    )
    
    skullLocations.register(
        SerializableImageNode(
            name: "bus.park.behind.spawn.room.skull",
            description: "IW.aotrt.skullhop.step1.bus.park.behind.spawn.room.skull.caption",
            position: 9,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "bus.park.behind.spawn.room.skull.outline",
                    boundingBox: .init(
                        x: 1349.0/2715.0,
                        y: 757.0/1527.0,
                        width: 6.0/2715.0,
                        height: 8.0/1527.0
                    )
                )
            ]
        ), at: [">", "bus.park.behind.spawn.room.skull"]
    )
    
    skullLocations.register(
        SerializableImageNode(
            name: "bus.park.behind.spawn.room.skull.zoom",
            description: "IW.aotrt.skullhop.step1.bus.park.behind.spawn.room.skull.zoom.caption",
            position: 0,
            overlays: [
                SerializableBoundingCircleNode(),
                SerializableOutlineNode(
                    resourceName: "bus.park.behind.spawn.room.skull.zoom.outline",
                    boundingBox: .init(
                        x: 1340.0/2715.0,
                        y: 739.0/1527.0,
                        width: 18.0/2715.0,
                        height: 48.0/1527.0
                    )
                )
            ]
        ), at: [">", "bus.park.behind.spawn.room.skull", "zoom"],
        withParameter: .init(
            bottomBarIcon: "plus.magnifyingglass",
            goBackBottomBarIcon: "minus.magnifyingglass",
            boundingFrame: .init(
                origin: .init(x: 1150.0/2715.0, y: 659.0/1527.0),
                size: .init(width: (200.0*16.0/9.0)/2715.0, height: 200.0/1527.0)
            )
        )
    )
    
    
    let skullhopstep1router = SerializableGalleryRouter()
    
    skullhopstep1router.router.register(SerializableGalleryNode(
        name: "iw.aotrt.skullhop.step1",
        position: 0,
        assetsImageName: "ghost.n.skull.logo",
        images: skullLocations
    ), at: [">", "master"])
    
    return skullhopstep1router
}
#endif
