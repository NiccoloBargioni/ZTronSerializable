#if DEBUG
public func makeSpacelandTabs() -> SerializableTabsRouter {
    let tabs = SerializableTabsRouter()
    
    tabs.router.register(makeSpacelandMusicTab(), at: [">", "music"])
    
    return tabs
}
#endif
