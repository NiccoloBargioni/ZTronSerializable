#if DEBUG

public func makeAOTRTSkullhopTab() -> SerializableTabNode {
    return SerializableTabNode(
        name: "skullhop",
        position: 0,
        iconName: "music.note",
        tools: makeAOTRTSkullhopTools()
    )
}

#endif
