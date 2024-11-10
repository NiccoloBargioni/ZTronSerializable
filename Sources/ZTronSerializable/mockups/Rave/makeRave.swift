#if DEBUG
public func makeRave() -> SerializableMapNode {
    return SerializableMapNode(
        name: "rave in the redwoods",
        position: 1,
        assetsImageName: "raveIcon",
        tabs: [
            makeRaveSideQuestsTab()
        ]
    )
}
#endif
