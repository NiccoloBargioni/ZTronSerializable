
#if DEBUG
public func makeSkullhopStep1Tool() -> SerializableToolNode {
    return SerializableToolNode(
        name: "skull locations",
        position: 0,
        assetsImageName: "IW.AOTRT.skullhop.step1.icon",
        galleryRouter: makeSkullhopStep1()
    )
}
#endif
