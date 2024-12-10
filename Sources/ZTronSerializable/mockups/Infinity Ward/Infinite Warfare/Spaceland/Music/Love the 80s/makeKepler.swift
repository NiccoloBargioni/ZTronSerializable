#if DEBUG

import Foundation
import ZTronRouter

func makeKepler() -> SerializableGalleryNode {
    let kepler = ImageRouter()
    
    // MARK: - FOUNTAINS LAMP
    kepler.register(
        SerializableImageNode(
            name: "kepler.lamp.outside.map.under.moonlight.cafe.coin.machine.teddy.bear",
            description: "IW.SPA.MUS.LT8.kepler.kepler.lamp.outside.map.under.moonlight.cafe.coin.machine.teddy.bear.caption",
            position: 0,
            searchLabel: "IW.SPA.MUS.LT8.kepler.kepler.lamp.outside.map.under.moonlight.cafe.coin.machine.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "kepler.lamp.outside.map.under.moonlight.cafe.coin.machine.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 2234.0/2715.0, y: 462.0/1527.0,
                    width: 13.0/2715.0, height: 26.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["kepler.lamp.outside.map.under.moonlight.cafe.coin.machine.teddy.bear"]
    )
    
    // MARK: - FOUNTAINS LAMP ZOOM
    kepler.register(
        SerializableImageNode(
            name: "kepler.lamp.outside.map.under.moonlight.cafe.coin.machine.teddy.zoom",
            description: "IW.SPA.MUS.LT8.kepler.kepler.lamp.outside.map.under.moonlight.cafe.coin.machine.teddy.bear.caption",
            position: 0,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "kepler.lamp.outside.map.under.moonlight.cafe.coin.machine.teddy.zoom.outline",
                    boundingBox: CGRect(
                    x: 1290.0/2715.0, y: 675.0/1527.0,
                    width: 30.0/2715.0, height: 35.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["kepler.lamp.outside.map.under.moonlight.cafe.coin.machine.teddy.bear", "zoom"],
        withParameter: SerializableImageNode.NavigationParameters(
            bottomBarIcon: "plus.magnifyingglass",
            goBackBottomBarIcon: "minus.magnifyingglass",
            boundingFrame: CGRect.NORMALIZED_FULL_SIZE
        )
    )
    
    // MARK: - CHROMOSPHERE LAMP
    kepler.register(
        SerializableImageNode(
            name: "kepler.lamp.behind.chromosphere.teddy.bear",
            description: "IW.SPA.MUS.LT8.kepler.kepler.lamp.behind.chromosphere.teddy.bear.caption",
            position: 1,
            searchLabel: "IW.SPA.MUS.LT8.kepler.kepler.lamp.behind.chromosphere.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "kepler.lamp.behind.chromosphere.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1337.0/2715.0, y: 753.0/1527.0,
                    width: 9.0/2715.0, height: 13.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["kepler.lamp.behind.chromosphere.teddy.bear"]
    )
    
    // MARK: - CONE LORD
    kepler.register(
        SerializableImageNode(
            name: "kepler.barrier.front.of.cone.lord.crocodile.trap.chromosphere.teddy.bear",
            description: "IW.SPA.MUS.LT8.kepler.kepler.barrier.front.of.cone.lord.crocodile.trap.chromosphere.teddy.bear.caption",
            position: 2,
            searchLabel: "IW.SPA.MUS.LT8.kepler.kepler.barrier.front.of.cone.lord.crocodile.trap.chromosphere.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "kepler.barrier.front.of.cone.lord.crocodile.trap.chromosphere.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1859.0/2715.0, y: 732.0/1527.0,
                    width: 28.0/2715.0, height: 27.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["kepler.barrier.front.of.cone.lord.crocodile.trap.chromosphere.teddy.bear"]
    )
    
    // MARK: - DJ BOOTH
    kepler.register(
        SerializableImageNode(
            name: "kepler.david.hasselhoff.dj.booth.crocodile.trap.octonian.hunter.teddy.bear",
            description: "IW.SPA.MUS.LT8.kepler.kepler.david.hasselhoff.dj.booth.crocodile.trap.octonian.hunter.teddy.bear.caption",
            position: 3,
            searchLabel: "IW.SPA.MUS.LT8.kepler.kepler.david.hasselhoff.dj.booth.crocodile.trap.octonian.hunter.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "kepler.david.hasselhoff.dj.booth.crocodile.trap.octonian.hunter.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1470.0/2715.0, y: 730.0/1527.0,
                    width: 25.0/2715.0, height: 32.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["kepler.david.hasselhoff.dj.booth.crocodile.trap.octonian.hunter.teddy.bear"]
    )
   
    // MARK: - DJ BOOTH ZOOM
    kepler.register(
        SerializableImageNode(
            name: "kepler.david.hasselhoff.dj.booth.crocodile.trap.octonian.hunter.teddy.bear.zoom",
            description: "IW.SPA.MUS.LT8.kepler.kepler.david.hasselhoff.dj.booth.crocodile.trap.octonian.hunter.teddy.bear.caption",
            position: 0,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "kepler.david.hasselhoff.dj.booth.crocodile.trap.octonian.hunter.teddy.bear.zoom.outline",
                    boundingBox: CGRect(
                    x: 1197.0/2715.0, y: 770.0/1527.0,
                    width: 122.0/2715.0, height: 137.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["kepler.david.hasselhoff.dj.booth.crocodile.trap.octonian.hunter.teddy.bear", "zoom"],
        withParameter: SerializableImageNode.NavigationParameters(
            bottomBarIcon: "plus.magnifyingglass",
            goBackBottomBarIcon: "minus.magnifyingglass",
            boundingFrame: CGRect.NORMALIZED_FULL_SIZE
        )
    )
    
    // MARK: - OCTONIAN HUNTER
    kepler.register(
        SerializableImageNode(
            name: "kepler.octonian.hunter.dj.booth.cosmic.tunes.david.hasselhoff.door.teddy.bear",
            description: "IW.SPA.MUS.LT8.kepler.kepler.octonian.hunter.dj.booth.cosmic.tunes.david.hasselhoff.door.teddy.bear.caption",
            position: 4,
            searchLabel: "IW.SPA.MUS.LT8.kepler.kepler.octonian.hunter.dj.booth.cosmic.tunes.david.hasselhoff.door.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "kepler.octonian.hunter.dj.booth.cosmic.tunes.david.hasselhoff.door.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1229.0/2715.0, y: 842.0/1527.0,
                    width: 21.0/2715.0, height: 23.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["kepler.octonian.hunter.dj.booth.cosmic.tunes.david.hasselhoff.door.teddy.bear"]
    )
    
    // MARK: - CROCODILE TRAP
    kepler.register(
        SerializableImageNode(
            name: "kepler.space.chomp.crocodile.trap.top.teddy.bear",
            description: "IW.SPA.MUS.LT8.kepler.kepler.space.chomp.crocodile.trap.top.teddy.bear.caption",
            position: 5,
            searchLabel: "IW.SPA.MUS.LT8.kepler.kepler.space.chomp.crocodile.trap.top.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "kepler.space.chomp.crocodile.trap.top.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1439.0/2715.0, y: 728.0/1527.0,
                    width: 8.0/2715.0, height: 7.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["kepler.space.chomp.crocodile.trap.top.teddy.bear"]
    )
    
    return SerializableGalleryNode(
        name: "kepler",
        position: 4,
        assetsImageName: "kepler.logo",
        images: kepler
    )
}

#endif
