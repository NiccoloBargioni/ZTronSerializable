#if DEBUG
public func makeRaveSideQuestsTab() -> SerializableTabNode {
    return SerializableTabNode(
        name: "side quests",
        position: 0,
        iconName: "gamecontroller",
        tools: [makeMemoryCharmsTool()]
    )
}
#endif
