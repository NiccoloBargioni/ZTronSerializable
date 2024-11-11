#if DEBUG
public func makeRaveTabs() -> SerializableTabsRouter {
    let tabs = SerializableTabsRouter()
    
    tabs.router.register(makeRaveSideQuestsTab(), at: [">", "side quests"])
    
    return tabs
}
#endif
