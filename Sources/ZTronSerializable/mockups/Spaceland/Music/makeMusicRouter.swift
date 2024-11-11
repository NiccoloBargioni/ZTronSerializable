#if DEBUG
public func makeSpacelandMusicToolsRouter() -> SerializableToolsRouterNode {
    let musicTools = SerializableToolsRouterNode()
    
    musicTools.router.register(
        makeLoveThe80sTool(),
        at: [">", "love the 80s"]
    )

    return musicTools
}
#endif
