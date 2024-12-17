#if DEBUG
func makeFormaldehydeImage(forPosition: Int) -> SerializableImageNode {
    assert(forPosition >= 0)
    
    return SerializableImageNode(
        name: "chemicals.lab.formaldehyde",
        description: "iw.aotrt.ee.chemicals.chemicals.lab.formaldehyde.caption",
        position: forPosition,
        overlays: []
    )
}
#endif

