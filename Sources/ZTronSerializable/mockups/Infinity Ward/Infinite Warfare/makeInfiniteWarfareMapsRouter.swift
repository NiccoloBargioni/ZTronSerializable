#if DEBUG
public func makeInfiniteWarfareMaps() -> SerializableMapsRouter {
    let iwMaps = SerializableMapsRouter()
    
    iwMaps.router.register(makeSpaceland(), at: [">", "spaceland"])
    iwMaps.router.register(makeRave(), at: [">", "rave in the redwoods"])
    iwMaps.router.register(makeAttack(), at: [">", "attack of the radioactive thing"])
    return iwMaps
}
#endif
