#if DEBUG

public func makeSpacelandMusicTab() -> SerializableTabNode {
    return SerializableTabNode(
        name: "music",
        position: 0,
        iconName: "music.note",
        tools: makeSpacelandMusicToolsRouter()
    )
}

#endif
