#if DEBUG
public func makeSpacelandMusicToolsRouter() -> SerializableToolsRouter {
    let musicTools = SerializableToolsRouter()
    
    musicTools.router.register(
        makeLoveThe80sTool(),
        at: [">", "love the 80s"]
    )

    return musicTools
}
#endif
