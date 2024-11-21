#if DEBUG

import Foundation
import ZTronDataModel
import ZTronRouter

public func makeLoveThe80s() -> SerializableGalleryRouter {
    let loveThe80sGalleries = SerializableGalleryRouter()
    
    loveThe80sGalleries.router.register(
        makeCosmicWay(),
        at: ["cosmic way"]
    )
    
    loveThe80sGalleries.router.register(
        makeJourneyIntoSpace(),
        at: ["journey into space"]
    )
    
    loveThe80sGalleries.router.register(
        makeAstrocade(),
        at: ["astrocade"]
    )
    
    loveThe80sGalleries.router.register(
        makePolarPeak(),
        at: ["polar peak"]
    )
    
    loveThe80sGalleries.router.register(
        makeKepler(),
        at: ["kepler"]
    )
    
    loveThe80sGalleries.router.register(
        makeUnderground(),
        at: ["underground"]
    )
    
    loveThe80sGalleries.router.register(
        makeAfterlife(),
        at: ["afterlife"]
    )

    return loveThe80sGalleries
}
#endif
