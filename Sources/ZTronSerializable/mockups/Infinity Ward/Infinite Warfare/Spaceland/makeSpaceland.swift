#if DEBUG
public func makeSpaceland() -> SerializableMapNode {
    return SerializableMapNode(
        name: "spaceland",
        position: 0,
        assetsImageName: "SpacelandCover",
        tabs: makeSpacelandTabs()
    )
}
#endif
