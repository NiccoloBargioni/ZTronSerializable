#if DEBUG
public func makeMemoryCharms() -> SerializableGalleryRouter {
    let memoryCharms = SerializableGalleryRouter()
    
    memoryCharms.router.register(makeBinoculars(), at: [">", "binoculars"])
    memoryCharms.router.register(makeShovel(), at: [">", "shovel"])
    memoryCharms.router.register(makeArrowHead(), at: [">", "arrowHead"])
    memoryCharms.router.register(makeRing(), at: [">", "ring"])
    memoryCharms.router.register(makeMask(), at: [">", "mask"])
    memoryCharms.router.register(makeBilliardBall(), at: [">", "billiardBall"])
    memoryCharms.router.register(makeFish(), at: [">", "fish"])
    memoryCharms.router.register(makeFrog(), at: [">", "frog"])
    memoryCharms.router.register(makePacifier(), at: [">", "pacifier"])
    memoryCharms.router.register(makeBoots(), at: [">", "boots"])
    memoryCharms.router.register(makeBoots(), at: [">", "boots"])
    
    return memoryCharms
}
#endif
