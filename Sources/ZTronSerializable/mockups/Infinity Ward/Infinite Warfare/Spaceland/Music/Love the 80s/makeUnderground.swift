#if DEBUG

import Foundation
import ZTronRouter

func makeUnderground() -> SerializableGalleryNode {
    let underground = ImageRouter()
    
    // MARK: - UTILITY ROOM FOUNTAINS
    underground.register(
        SerializableImageNode(
            name: "underground.utility.room.door.from.fountains.teddy.bear",
            description: "IW.SPA.MUS.LT8.underground.underground.utility.room.door.from.fountains.teddy.bear.caption",
            position: 0,
            searchLabel: "IW.SPA.MUS.LT8.underground.underground.utility.room.door.from.fountains.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "underground.utility.room.door.from.fountains.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1248.0/2715.0, y: 934.0/1527.0,
                    width: 37.0/2715.0, height: 51.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["underground.utility.room.door.from.fountains.teddy.bear"]
    )
    
    // MARK: DOCUMENTS SHREDDER
    underground.register(
        SerializableImageNode(
            name: "underground.shredder.cutout.documents.teddy.bear",
            description: "IW.SPA.MUS.LT8.underground.underground.shredder.cutout.documents.teddy.bear.caption",
            position: 1,
            searchLabel: "IW.SPA.MUS.LT8.underground.underground.shredder.cutout.documents.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "underground.shredder.cutout.documents.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1551.0/2715.0, y: 847.0/1527.0,
                    width: 24.0/2715.0, height: 41.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["underground.shredder.cutout.documents.teddy.bear"]
    )
    
    // MARK: - SHELF NEAR SHREDDER
    underground.register(
        SerializableImageNode(
            name: "underground.behind.shredder.cutout.shelf.teddy.bear",
            description: "IW.SPA.MUS.LT8.underground.underground.behind.shredder.cutout.shelf.teddy.bear.caption",
            position: 2,
            searchLabel: "IW.SPA.MUS.LT8.underground.underground.behind.shredder.cutout.shelf.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "underground.behind.shredder.cutout.shelf.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1063.0/2715.0, y: 663.0/1527.0,
                    width: 36.0/2715.0, height: 39.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["underground.behind.shredder.cutout.shelf.teddy.bear"]
    )
    
    // MARK: - ALIEN SHUTTER
    underground.register(
        SerializableImageNode(
            name: "underground.under.alien.shutter.kepler.logo.teddy.bear",
            description: "IW.SPA.MUS.LT8.underground.underground.under.alien.shutter.kepler.logo.teddy.bear.caption",
            position: 3,
            searchLabel: "IW.SPA.MUS.LT8.underground.underground.under.alien.shutter.kepler.logo.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "underground.under.alien.shutter.kepler.logo.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1030.0/2715.0, y: 776.0/1527.0,
                    width: 28.0/2715.0, height: 17.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["underground.under.alien.shutter.kepler.logo.teddy.bear"]
    )

    // MARK: - EMPLOYEES ONLY CHAIR
    underground.register(
        SerializableImageNode(
            name: "underground.employees.only.chair.stereo.teddy.bear",
            description: "IW.SPA.MUS.LT8.underground.underground.employees.only.chair.stereo.teddy.bear.caption",
            position: 4,
            searchLabel: "IW.SPA.MUS.LT8.underground.underground.employees.only.chair.stereo.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "underground.employees.only.chair.stereo.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 330.0/2715.0, y: 823.0/1527.0,
                    width: 130.0/2715.0, height: 107.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["underground.employees.only.chair.stereo.teddy.bear"]
    )
    
    // MARK: - EMPLOYEES ONLY DESK
    underground.register(
        SerializableImageNode(
            name: "underground.employees.only.desk.stereo.teddy.bear",
            description: "IW.SPA.MUS.LT8.underground.underground.employees.only.desk.stereo.teddy.bear.caption",
            position: 5,
            searchLabel: "IW.SPA.MUS.LT8.underground.underground.employees.only.desk.stereo.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "underground.employees.only.desk.stereo.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 47.0/2715.0, y: 829.0/1527.0,
                    width: 129.0/2715.0, height: 94.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["underground.employees.only.desk.stereo.teddy.bear"]
    )
    
    // MARK: - JUNK MURALES
    underground.register(
        SerializableImageNode(
            name: "underground.employees.only.murales.junk.trash.teddy.bear",
            description: "IW.SPA.MUS.LT8.underground.underground.employees.only.murales.junk.trash.teddy.bear.caption",
            position: 6,
            searchLabel: "IW.SPA.MUS.LT8.underground.underground.employees.only.murales.junk.trash.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "underground.employees.only.murales.junk.trash.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 2122.0/2714.0, y: 748.0/1526.0,
                    width: 74.0/2714.0, height: 44.0/1526.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["underground.employees.only.murales.junk.trash.teddy.bear"]
    )
    
    // MARK: - RED PIPE
    underground.register(
        SerializableImageNode(
            name: "underground.red.pipes.ceiling.kepler.logo.teddy.bear",
            description: "IW.SPA.MUS.LT8.underground.underground.red.pipes.ceiling.kepler.logo.teddy.bear.caption",
            position: 7,
            searchLabel: "IW.SPA.MUS.LT8.underground.underground.red.pipes.ceiling.kepler.logo.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "underground.red.pipes.ceiling.kepler.logo.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1320.0/2715.0, y: 559.0/1527.0,
                    width: 22.0/2715.0, height: 26.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["underground.red.pipes.ceiling.kepler.logo.teddy.bear"]
    )
    
    // MARK: - RACING STRIPES
    underground.register(
        SerializableImageNode(
            name: "underground.employees.only.racing.stripes.seti.teddy.bear",
            description: "IW.SPA.MUS.LT8.underground.underground.employees.only.racing.stripes.seti.teddy.bear.caption",
            position: 8,
            searchLabel: "IW.SPA.MUS.LT8.underground.underground.employees.only.racing.stripes.seti.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "underground.employees.only.racing.stripes.seti.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1105.0/2715.0, y: 849.0/1527.0,
                    width: 18.0/2715.0, height: 88.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["underground.employees.only.racing.stripes.seti.teddy.bear"]
    )
    
    // MARK: - YETI SHUTTER
    underground.register(
        SerializableImageNode(
            name: "underground.yeti.shutter.racing.stripes.ticket.vendor.rooftop.teddy.bear",
            description: "IW.SPA.MUS.LT8.underground.underground.yeti.shutter.racing.stripes.ticket.vendor.rooftop.teddy.bear.caption",
            position: 9,
            searchLabel: "IW.SPA.MUS.LT8.underground.underground.yeti.shutter.racing.stripes.ticket.vendor.rooftop.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "underground.yeti.shutter.racing.stripes.ticket.vendor.rooftop.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1353.0/2715.0, y: 737.0/1527.0,
                    width: 16.0/2715.0, height: 24.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["underground.yeti.shutter.racing.stripes.ticket.vendor.rooftop.teddy.bear"]
    )
    
    // MARK: - YETI SHUTTER ZOOM
    underground.register(
        SerializableImageNode(
            name: "underground.yeti.shutter.racing.stripes.ticket.vendor.rooftop.teddy.bear.zoom",
            description: "IW.SPA.MUS.LT8.underground.underground.yeti.shutter.racing.stripes.ticket.vendor.rooftop.teddy.bear.caption",
            position: 0,
            overlays: [
                SerializableOutlineNode(
                    resourceName: "underground.yeti.shutter.racing.stripes.ticket.vendor.rooftop.teddy.bear.zoom.outline",
                    boundingBox: CGRect(
                    x: 1191.0/2715.0, y: 614.0/1527.0,
                    width: 95.0/2715.0, height: 119.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["underground.yeti.shutter.racing.stripes.ticket.vendor.rooftop.teddy.bear", "zoom"],
        withParameter: SerializableImageNode.NavigationParameters(
            bottomBarIcon: "plus.magnifyingglass",
            goBackBottomBarIcon: "minus.magnifyingglass",
            boundingFrame: CGRect.NORMALIZED_FULL_SIZE
        )
    )
    
    // MARK: - RACING STRIPES LADDER
    underground.register(
        SerializableImageNode(
            name: "underground.ticket.vendor.racing.stripes.above.ladder.teddy.bear",
            description: "IW.SPA.MUS.LT8.underground.underground.ticket.vendor.racing.stripes.above.ladder.teddy.bear.caption",
            position: 10,
            searchLabel: "IW.SPA.MUS.LT8.underground.underground.ticket.vendor.racing.stripes.above.ladder.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "underground.ticket.vendor.racing.stripes.above.ladder.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 571.0/2715.0, y: 471.0/1527.0,
                    width: 44.0/2715.0, height: 50.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["underground.ticket.vendor.racing.stripes.above.ladder.teddy.bear"]
    )
    
    // MARK: - HALLWAY CEILING
    underground.register(
        SerializableImageNode(
            name: "underground.hallway.red.pipe.rooftop.teddy.bear",
            description: "IW.SPA.MUS.LT8.underground.underground.hallway.red.pipe.rooftop.teddy.bear.caption",
            position: 11,
            searchLabel: "IW.SPA.MUS.LT8.underground.underground.hallway.red.pipe.rooftop.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "underground.hallway.red.pipe.rooftop.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1099.0/2715.0, y: 683.0/1527.0,
                    width: 33.0/2715.0, height: 25.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["underground.hallway.red.pipe.rooftop.teddy.bear"]
    )
    
    // MARK: - ASTRONAUT CUTOUT
    underground.register(
        SerializableImageNode(
            name: "underground.astronaut.cutout.journey.entrance.teddy.bear",
            description: "IW.SPA.MUS.LT8.underground.underground.astronaut.cutout.journey.entrance.teddy.bear.caption",
            position: 12,
            searchLabel: "IW.SPA.MUS.LT8.underground.underground.astronaut.cutout.journey.entrance.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "underground.astronaut.cutout.journey.entrance.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1308.0/2715.0, y: 652.0/1527.0,
                    width: 23.0/2715.0, height: 50.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["underground.astronaut.cutout.journey.entrance.teddy.bear"]
    )
    
    // MARK: - ARCADE SHUTTER
    underground.register(
        SerializableImageNode(
            name: "underground.arcade.shutter.astrocade.entrance.teddy.bear",
            description: "IW.SPA.MUS.LT8.underground.underground.arcade.shutter.astrocade.entrance.teddy.bear.caption",
            position: 13,
            searchLabel: "IW.SPA.MUS.LT8.underground.underground.arcade.shutter.astrocade.entrance.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "underground.arcade.shutter.astrocade.entrance.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 790.0/2715.0, y: 767.0/1527.0,
                    width: 23.0/2715.0, height: 43.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["underground.arcade.shutter.astrocade.entrance.teddy.bear"]
    )
    
    return SerializableGalleryNode(
        name: "underground",
        position: 5,
        assetsImageName: "underground.logo",
        images: underground
    )
}

#endif
