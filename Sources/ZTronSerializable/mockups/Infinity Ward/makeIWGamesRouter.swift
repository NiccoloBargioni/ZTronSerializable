#if DEBUG
public func makeIWGamesRouter() -> SerializableGamesRouter {
    let allIWGames = SerializableGamesRouter()
    
    allIWGames.router.register(makeInfiniteWarfare(), at: [">", "infinite warfare"])
    
    return allIWGames
}
#endif
