#if DEBUG
import ZTronRouter

public func makeAllStudios() -> SerializableStudioRouter {
    let allStudios = ZTronRouter<Empty, SerializableStudioNode, Empty>()
    
    allStudios.register(
        makeInfinityWard(),
        at: [">", "infinity ward"]
    )
    
    return SerializableStudioRouter(studios: allStudios)
}
#endif
