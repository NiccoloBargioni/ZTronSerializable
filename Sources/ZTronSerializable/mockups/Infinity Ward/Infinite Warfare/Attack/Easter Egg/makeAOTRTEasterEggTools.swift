#if DEBUG
func makeAOTRTEasterEggTools() -> SerializableToolsRouter {
    let tools = SerializableToolsRouter()
    tools.router.register(makeAOTRTChemicals(), at: [">", "iw.aotrt.ee.chemicals.tool.name"])
    return tools
}
#endif
