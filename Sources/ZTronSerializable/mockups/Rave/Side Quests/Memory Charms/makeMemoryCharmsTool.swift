#if DEBUG
public func makeMemoryCharmsTool() -> SerializableToolNode {
    return SerializableToolNode(
        name: "memory charms",
        position: 0,
        assetsImageName: "memoryCharmsIcon",
        galleryRouter: makeMemoryCharms()
    )
}
#endif
