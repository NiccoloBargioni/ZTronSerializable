#if DEBUG
public func makeInfiniteWarfareMaps() -> SerializableMapsRouter {
    let iwMaps = SerializableMapsRouter()
    
    iwMaps.router.register(makeSpaceland(), at: [">", "spaceland"])
    iwMaps.router.register(makeRave(), at: [">", "rave in the redwoods"])
    
    return iwMaps
}
#endif
