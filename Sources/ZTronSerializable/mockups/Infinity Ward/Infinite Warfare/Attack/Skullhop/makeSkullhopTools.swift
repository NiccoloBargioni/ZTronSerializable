#if DEBUG
public func makeAOTRTSkullhopTools() -> SerializableToolsRouter {
    let skullhopTools = SerializableToolsRouter()
    
    skullhopTools.router.register(
        makeSkullhopStep1Tool(),
        at: [">", "skullhop step 1"]
    )

    return skullhopTools
}
#endif
