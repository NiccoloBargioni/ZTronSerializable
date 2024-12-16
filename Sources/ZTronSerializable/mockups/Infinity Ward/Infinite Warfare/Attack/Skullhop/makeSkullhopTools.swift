#if DEBUG
public func makeAOTRTSkullhopTools() -> SerializableToolsRouter {
    let skullhopTools = SerializableToolsRouter()
    
    skullhopTools.router.register(
        makeLoveThe80sTool(),
        at: [">", "love the 80s"]
    )

    return skullhopTools
}
#endif
