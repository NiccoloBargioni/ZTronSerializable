#if DEBUG
public func makeRaveSideQuestsToolsRouter() -> SerializableToolsRouter {
    let sideQTools = SerializableToolsRouter()
    
    sideQTools.router.register(makeMemoryCharmsTool(), at: [">", "memory charms"])
    
    return sideQTools
}
#endif
