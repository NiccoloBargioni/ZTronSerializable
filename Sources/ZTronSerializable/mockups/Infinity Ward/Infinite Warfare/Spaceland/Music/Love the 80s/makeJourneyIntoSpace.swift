#if DEBUG

import Foundation
import ZTronRouter

func makeJourneyIntoSpace() -> SerializableGalleryNode {
    let journeyImages = ImageRouter()
        
    // MARK: - MOONSHAKES TERRACE
    journeyImages.register(SerializableImageNode(
        name: "journey.terrace.railings.above.moonshakes.teddy.bear",
        description: "IW.SPA.MUS.LT8.journey into space.journey.terrace.railings.above.moonshakes.teddy.bear.caption",
        position: 0,
        searchLabel: "journey.terrace.railings.above.moonshakes.teddy.bear.search.label",
        overlays: [
            SerializableOutlineNode(
                resourceName: "journey.terrace.railings.above.moonshakes.teddy.bear.outline",
                boundingBox: CGRect(
                x: 1158.0/2715.0, y: 678.0/1527.0,
                width: 20.0/2715.0, height: 35.0/1527.0
            )),
            SerializableBoundingCircleNode()
        ]
    ), at: ["journey.terrace.railings.above.moonshakes.teddy.bear"])
    
    
    // MARK: - MOONSHAKES LOCATION 2
    journeyImages.register(SerializableImageNode(
        name: "journey.inside.moonshakes.star.mission.trap.teddy.bear",
        description: "IW.SPA.MUS.LT8.journey into space.journey.inside.moonshakes.star.mission.trap.teddy.bear.caption",
        position: 1,
        searchLabel: "IW.SPA.MUS.LT8.journey into space.journey.inside.moonshakes.star.mission.trap.teddy.bear.search.label",
        overlays: [
            SerializableOutlineNode(
                resourceName: "journey.inside.moonshakes.star.mission.trap.teddy.bear.outline",
                boundingBox: CGRect(
                x: 2247.0/2714.0, y: 617.0/1526.0,
                width: 94.0/2714.0, height: 85.0/1526.0
            )),
            SerializableBoundingCircleNode()
        ]
    ), at: ["journey.inside.moonshakes.star.mission.trap.teddy.bear"])
    
    // MARK: - MOONSHAKES TOILET
    journeyImages.register(SerializableImageNode(
        name: "journey.tuff.nuff.moonshakes.star.mission.further.toilet.teddy.bear",
        description: "IW.SPA.MUS.LT8.journey into space.journey.tuff.nuff.moonshakes.star.mission.further.toilet.teddy.bear.caption",
        position: 2,
        searchLabel: "IW.SPA.MUS.LT8.journey into space.journey.tuff.nuff.moonshakes.star.mission.further.toilet.teddy.bear.search.label",
        overlays: [
            SerializableOutlineNode(
                resourceName: "journey.tuff.nuff.moonshakes.star.mission.further.toilet.teddy.bear.outline",
                boundingBox: CGRect(
                x: 367.0/2715.0, y: 905.0/1527.0,
                width: 74.0/2715.0, height: 107.0/1527.0
            )),
            SerializableBoundingCircleNode()
        ]
    ), at: ["journey.tuff.nuff.moonshakes.star.mission.further.toilet.teddy.bear"])
    
    // MARK: - TUFF 'NUFF TOILET
    journeyImages.register(SerializableImageNode(
        name: "journey.tuff.nuff.moonshakes.star.mission.closer.toilet.teddy.bear",
        description: "IW.SPA.MUS.LT8.journey into space.journey.tuff.nuff.moonshakes.star.mission.closer.toilet.teddy.bear.caption",
        position: 3,
        searchLabel: "IW.SPA.MUS.LT8.journey into space.journey.tuff.nuff.moonshakes.star.mission.closer.toilet.teddy.bear.search.label",
        overlays: [
            SerializableOutlineNode(
                resourceName: "journey.tuff.nuff.moonshakes.star.mission.closer.toilet.teddy.bear.outline",
                boundingBox: CGRect(
                x: 572.0/2715.0, y: 685.0/1527.0,
                width: 46.0/2715.0, height: 62.0/1527.0
            )),
            SerializableBoundingCircleNode()
        ]
    ), at: ["journey.tuff.nuff.moonshakes.star.mission.closer.toilet.teddy.bear"])

    // MARK: - BUMPER CARS
    journeyImages.register(SerializableImageNode(
        name: "journey.bumper.cars.trap.left.of.entrance.teddy.bear",
        description: "IW.SPA.MUS.LT8.journey into space.journey.bumper.cars.trap.left.of.entrance.teddy.bear.caption",
        position: 4,
        searchLabel: "IW.SPA.MUS.LT8.journey into space.journey.bumper.cars.trap.left.of.entrance.teddy.bear.search.label",
        overlays: [
            SerializableOutlineNode(
                resourceName: "journey.bumper.cars.trap.left.of.entrance.teddy.outline",
                boundingBox: CGRect(
                x: 165.0/2715.0, y: 683.0/1527.0,
                width: 77.0/2715.0, height: 55.0/1527.0
            )),
            SerializableBoundingCircleNode()
        ]
    ), at: ["journey.bumper.cars.trap.left.of.entrance.teddy.bear"])
    
    // MARK: - ASTRONAUT CUTOUT
    journeyImages.register(SerializableImageNode(
        name: "journey.spaceman.astronaut.cutout.outside.astrocade.bumper.cars.teddy.bear",
        description: "IW.SPA.MUS.LT8.journey into space.journey.spaceman.astronaut.cutout.outside.astrocade.bumper.cars.teddy.bear.caption",
        position: 5,
        searchLabel: "journey.spaceman.astronaut.cutout.outside.astrocade.bumper.cars.teddy.bear.search.label",
        overlays: [
            SerializableOutlineNode(
                resourceName: "journey.spaceman.astronaut.cutout.outside.astrocade.bumper.cars.teddy.bear.outline",
                boundingBox: CGRect(
                x: 1130.0/2715.0, y: 736.0/1527.0,
                width: 16.0/2715.0, height: 15.0/1527.0
            )),
            SerializableBoundingCircleNode()
        ]
    ), at: ["journey.spaceman.astronaut.cutout.outside.astrocade.bumper.cars.teddy.bear"])

    // MARK: - BLUE BOLTS
    journeyImages.register(SerializableImageNode(
        name: "journey.rooftop.above.blue.bolts.astrocade.coin.machine.underground.entrance.teddy.bear",
        description: "IW.SPA.MUS.LT8.journey into space.journey.rooftop.above.blue.bolts.astrocade.coin.machine.underground.entrance.teddy.bear.caption",
        position: 6,
        searchLabel: "IW.SPA.MUS.LT8.journey into space.journey.rooftop.above.blue.bolts.astrocade.coin.machine.underground.entrance.teddy.bear.search.label",
        overlays: [
            SerializableOutlineNode(
                resourceName: "journey.rooftop.above.blue.bolts.astrocade.coin.machine.underground.entrance.teddy.bear.outline",
                boundingBox: CGRect(
                x: 1065.0/2715.0, y: 802.0/1527.0,
                width: 13.0/2715.0, height: 19.0/1527.0
            )),
            SerializableBoundingCircleNode()
        ]
    ), at: ["journey.rooftop.above.blue.bolts.astrocade.coin.machine.underground.entrance.teddy.bear"])
        
    return SerializableGalleryNode(
        name: "journey into space",
        position: 1,
        assetsImageName: "journey.into.space.logo",
        images: journeyImages
    )
}

#endif
