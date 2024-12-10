#if DEBUG

import Foundation
import ZTronRouter

func makeAfterlife() -> SerializableGalleryNode {
    let afterlife = ImageRouter()
    
    // MARK: - AFTERLIFE DOOR
    afterlife.register(
        SerializableImageNode(
            name: "afterlife.door.teddy.bear",
            description: "IW.SPA.MUS.LT8.afterlife.afterlife.door.teddy.bear.caption",
            position: 0,
            searchLabel: "IW.SPA.MUS.LT8.afterlife.afterlife.door.teddy.bear.search.label",
            overlays: [
                SerializableOutlineNode(
                    resourceName: "afterlife.door.teddy.bear.outline",
                    boundingBox: CGRect(
                    x: 1288.0/2715.0, y: 722.0/1527.0,
                    width: 19.0/2715.0, height: 32.0/1527.0
                )),

                SerializableBoundingCircleNode()
            ]
        ),
        at: ["afterlife.door.teddy.bear"]
    )
    
    return SerializableGalleryNode(
        name: "afterlife",
        position: 6,
        assetsImageName: "afterlife.logo",
        images: afterlife
    )
}

#endif
