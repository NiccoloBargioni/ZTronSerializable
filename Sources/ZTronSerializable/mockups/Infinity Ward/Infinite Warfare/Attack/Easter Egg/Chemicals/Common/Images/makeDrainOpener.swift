#if DEBUG
func makeDrainOpener(forPosition: Int) -> SerializableImageNode {
    assert(forPosition >= 0)
    
    return SerializableImageNode(
        name: "campers.bathroom.drain.opener",
        description: "iw.aotrt.ee.chemicals.campers.bathroom.drain.opener.caption",
        position: forPosition,
        overlays: []
    )
}
#endif
