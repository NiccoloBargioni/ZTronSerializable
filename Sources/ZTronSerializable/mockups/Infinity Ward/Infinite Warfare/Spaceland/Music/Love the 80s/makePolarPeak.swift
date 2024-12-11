#if DEBUG

import Foundation
import ZTronRouter

func makePolarPeak() -> SerializableGalleryNode {
    let polarImages = ImageRouter()
    
    // MARK: - YETI THRONE
    polarImages.register(
        SerializableImageNode(
            name: "polar.peak.yeti.king.throne.cave.teddy.bear",
            description: "IW.SPA.MUS.LT8.polar peak.polar.peak.yeti.king.throne.cave.teddy.bear.caption",
            position: 0,
            searchLabel: "IW.SPA.MUS.LT8.polar peak.polar.peak.yeti.king.throne.cave.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "polar.peak.yeti.king.throne.cave.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1232.0/2715.0, y: 830.0/1527.0,
                    width: 9.0/2715.0, height: 11.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["polar.peak.yeti.king.throne.cave.teddy.bear"]
    )
    
    // MARK: - YETI THRONE ZOOM
    polarImages.register(
        SerializableImageNode(
            name: "polar.peak.yeti.king.throne.cave.teddy.bear.zoom",
            description: "IW.SPA.MUS.LT8.polar peak.polar.peak.yeti.king.throne.cave.teddy.bear.caption",
            position: 0,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "polar.peak.yeti.king.throne.cave.teddy.bear.zoom.outline",
                    boundingBox: CGRect(
                    x: 383.0/1920.0, y: 641.0/1080.0,
                    width: 40.0/1920.0, height: 50.0/1080.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["polar.peak.yeti.king.throne.cave.teddy.bear", "zoom"],
        withParameter: SerializableImageNode.NavigationParameters(
            bottomBarIcon: "plus.magnifyingglass",
            goBackBottomBarIcon: "minus.magnifyingglass",
            boundingFrame: CGRect.NORMALIZED_FULL_SIZE
        )
    )
    
    // MARK: A01 FURNITURE
    polarImages.register(
        SerializableImageNode(
            name: "polar.peak.a01.shop.window.furniture.teddy.bear",
            description: "IW.SPA.MUS.LT8.polar peak.polar.peak.a01.shop.window.furniture.teddy.bear.caption",
            position: 1,
            searchLabel: "IW.SPA.MUS.LT8.polar peak.polar.peak.a01.shop.window.furniture.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "polar.peak.a01.shop.window.furniture.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 808.0/2715.0, y: 481.0/1527.0,
                    width: 25.0/2715.0, height: 29.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["polar.peak.a01.shop.window.furniture.teddy.bear"]
    )
    
    // MARK: - A01 VEHICLE
    polarImages.register(
        SerializableImageNode(
            name: "polar.peak.a01.shop.window.vehicle.seat.teddy.bear",
            description: "IW.SPA.MUS.LT8.polar peak.polar.peak.a01.shop.window.vehicle.seat.teddy.bear.caption",
            position: 2,
            searchLabel: "IW.SPA.MUS.LT8.polar peak.polar.peak.a01.shop.window.vehicle.seat.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "polar.peak.a01.shop.window.vehicle.seat.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 455.0/2715.0, y: 656.0/1527.0,
                    width: 65.0/2715.0, height: 51.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["polar.peak.a01.shop.window.vehicle.seat.teddy.bear"]
    )
    
    // MARK: - YETI ENTRANCE
    polarImages.register(
        SerializableImageNode(
            name: "polar.peak.yeti.cave.from.cosmic.way.door.teddy.bear",
            description: "IW.SPA.MUS.LT8.polar peak.polar.peak.yeti.cave.from.cosmic.way.door.teddy.bear.caption",
            position: 3,
            searchLabel: "IW.SPA.MUS.LT8.polar peak.polar.peak.yeti.cave.from.cosmic.way.door.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "polar.peak.yeti.cave.from.cosmic.way.door.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1607.0/2715.0, y: 647.0/1527.0,
                    width: 28.0/2715.0, height: 48.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["polar.peak.yeti.cave.from.cosmic.way.door.teddy.bear"]
    )
    
    // MARK: - ENTRANCE CAVE
    polarImages.register(
        SerializableImageNode(
            name: "polar.peak.cave.front.of.yeti.from.cosmic.way.door.teddy.bear",
            description: "IW.SPA.MUS.LT8.polar peak.polar.peak.cave.front.of.yeti.from.cosmic.way.door.teddy.bear.caption",
            position: 4,
            searchLabel: "IW.SPA.MUS.LT8.polar peak.polar.peak.cave.front.of.yeti.from.cosmic.way.door.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "polar.peak.cave.front.of.yeti.from.cosmic.way.door.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1759.0/2715.0, y: 643.0/1527.0,
                    width: 33.0/2715.0, height: 27.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["polar.peak.cave.front.of.yeti.from.cosmic.way.door.teddy.bear"]
    )
    
    // MARK: - STEEL DRAGON BARRICADE
    polarImages.register(
        SerializableImageNode(
            name: "polar.peak.barricade.dragon.breath.trap.teddy.bear",
            description: "IW.SPA.MUS.LT8.polar peak.polar.peak.barricade.dragon.breath.trap.teddy.bear.caption",
            position: 5,
            searchLabel: "IW.SPA.MUS.LT8.polar peak.polar.peak.barricade.dragon.breath.trap.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "polar.peak.barricade.dragon.breath.trap.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1799.0/2715.0, y: 725.0/1527.0,
                    width: 36.0/2715.0, height: 38.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["polar.peak.barricade.dragon.breath.trap.teddy.bear"]
    )
    
    // MARK: - PORTAL COOKIES
    polarImages.register(
        SerializableImageNode(
            name: "polar.peak.portal.room.cookies.shelf.teddy.bear",
            description: "IW.SPA.MUS.LT8.polar peak.polar.peak.portal.room.cookies.shelf.teddy.bear.caption",
            position: 6,
            searchLabel: "IW.SPA.MUS.LT8.polar peak.polar.peak.portal.room.cookies.shelf.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "polar.peak.portal.room.cookies.shelf.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 911.0/2715.0, y: 667.0/1527.0,
                    width: 39.0/2715.0, height: 42.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["polar.peak.portal.room.cookies.shelf.teddy.bear"]
    )
    
    // MARK: - PORTAL LEDGE
    polarImages.register(
        SerializableImageNode(
            name: "polar.peak.ledge.above.portal.astronauts.spacemen.shelf.teddy.bear",
            description: "IW.SPA.MUS.LT8.polar peak.polar.peak.ledge.above.portal.astronauts.spacemen.shelf.teddy.bear.caption",
            position: 7,
            searchLabel: "IW.SPA.MUS.LT8.polar peak.polar.peak.ledge.above.portal.astronauts.spacemen.shelf.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "polar.peak.ledge.above.portal.astronauts.spacemen.shelf.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1730.0/2715.0, y: 590.0/1527.0,
                    width: 23.0/2715.0, height: 24.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["polar.peak.ledge.above.portal.astronauts.spacemen.shelf.teddy.bear"]
    )

    // MARK: - COUNTER BARRICADE
    polarImages.register(
        SerializableImageNode(
            name: "polar.peak.coin.machine.umbrella.counter.barrier.teddy.bear",
            description: "IW.SPA.MUS.LT8.polar peak.polar.peak.coin.machine.umbrella.counter.barrier.teddy.bear.caption",
            position: 8,
            searchLabel: "IW.SPA.MUS.LT8.polar peak.polar.peak.coin.machine.umbrella.counter.barrier.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "polar.peak.coin.machine.umbrella.counter.barrier.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 581.0/2715.0, y: 721.0/1527.0,
                    width: 19.0/2715.0, height: 33.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["polar.peak.coin.machine.umbrella.counter.barrier.teddy.bear"]
    )
    
    // MARK: - TRASHCANS ROLLER C.
    polarImages.register(
        SerializableImageNode(
            name: "polar.peak.employee.of.the.month.roller.coaster.trashcans.teddy.bear",
            description: "IW.SPA.MUS.LT8.polar peak.polar.peak.employee.of.the.month.roller.coaster.trashcans.teddy.bear.caption",
            position: 9,
            searchLabel: "IW.SPA.MUS.LT8.polar peak.polar.peak.employee.of.the.month.roller.coaster.trashcans.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "polar.peak.employee.of.the.month.roller.coaster.trashcans.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1681.0/2715.0, y: 698.0/1527.0,
                    width: 26.0/2715.0, height: 53.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["polar.peak.employee.of.the.month.roller.coaster.trashcans.teddy.bear"]
    )
    
    // MARK: - EMPLOYEE OF THE MONTH
    polarImages.register(
        SerializableImageNode(
            name: "polar.peak.employee.of.the.month.booth.teddy.bear",
            description: "IW.SPA.MUS.LT8.polar peak.polar.peak.employee.of.the.month.booth.teddy.bear.caption",
            position: 10,
            searchLabel: "IW.SPA.MUS.LT8.polar peak.polar.peak.employee.of.the.month.booth.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "polar.peak.employee.of.the.month.booth.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 275.0/2715.0, y: 810.0/1527.0,
                    width: 135.0/2715.0, height: 99.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["polar.peak.employee.of.the.month.booth.teddy.bear"]
    )

    // MARK: - BARRICADE ROLLER C.
    polarImages.register(
        SerializableImageNode(
            name: "polar.peak.roller.coaster.volk.wallbuy.barricade.teddy.bear",
            description: "IW.SPA.MUS.LT8.polar peak.polar.peak.roller.coaster.volk.wallbuy.barricade.teddy.bear.caption",
            position: 11,
            searchLabel: "IW.SPA.MUS.LT8.polar peak.polar.peak.roller.coaster.volk.wallbuy.barricade.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "polar.peak.roller.coaster.volk.wallbuy.barricade.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 421.0/2715.0, y: 841.0/1527.0,
                    width: 90.0/2715.0, height: 75.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["polar.peak.roller.coaster.volk.wallbuy.barricade.teddy.bear"]
    )
    
    // MARK: - HYPERSLOPES CHAIR 1
    polarImages.register(
        SerializableImageNode(
            name: "polar.peak.fountains.hyperslopes.booth.chair.desk.teddy.bear",
            description: "IW.SPA.MUS.LT8.polar peak.polar.peak.fountains.hyperslopes.booth.chair.desk.teddy.bear.caption",
            position: 12,
            searchLabel: "IW.SPA.MUS.LT8.polar peak.polar.peak.fountains.hyperslopes.booth.chair.desk.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "polar.peak.fountains.hyperslopes.booth.chair.desk.teddy.bear.outline",
                    boundingBox: CGRect(
                        x: 2096.0/2715.0, y: 663.0/1527.0,
                        width: 109.0/2715.0, height: 80.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["polar.peak.fountains.hyperslopes.booth.chair.desk.teddy.bear"]
    )

    // MARK: - HYPERSLOPES CHAIR 2
    polarImages.register(
        SerializableImageNode(
            name: "polar.peak.fountains.hyperslopes.booth.chair.door.teddy.bear",
            description: "IW.SPA.MUS.LT8.polar peak.polar.peak.fountains.hyperslopes.booth.chair.door.teddy.bear.caption",
            position: 13,
            searchLabel: "IW.SPA.MUS.LT8.polar peak.polar.peak.fountains.hyperslopes.booth.chair.door.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "polar.peak.fountains.hyperslopes.booth.chair.door.teddy.bear.outline",
                    boundingBox: CGRect(
                        x: 1694.0/2715.0, y: 719.0/1527.0,
                        width: 21.0/2715.0, height: 22.0/1527.0
                    )
                ),
                SerializableBoundingCircleNode()
            ]
        ),
        at: ["polar.peak.fountains.hyperslopes.booth.chair.door.teddy.bear"]
    )
    
    // MARK: - FOUNTAINS
    polarImages.register(
        SerializableImageNode(
            name: "polar.peak.fountains.outside.map.behind.bang.bangs.teddy.bear",
            description: "IW.SPA.MUS.LT8.polar peak.polar.peak.fountains.outside.map.behind.bang.bangs.teddy.bear.caption",
            position: 14,
            searchLabel: "IW.SPA.MUS.LT8.polar peak.polar.peak.fountains.outside.map.behind.bang.bangs.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "polar.peak.fountains.outside.map.behind.bang.bangs.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 2069.0/2715.0, y: 711.0/1527.0,
                    width: 25.0/2715.0, height: 31.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["polar.peak.fountains.outside.map.behind.bang.bangs.teddy.bear"]
    )
    
    return SerializableGalleryNode(
        name: "polar peak",
        position: 3,
        assetsImageName: "polar.peak.logo",
        images: polarImages
    )
}
#endif
