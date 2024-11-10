import Foundation

#if DEBUG
public func makeInfinityWard() -> SerializableStudioNode {
    return SerializableStudioNode(
        name: "infinity ward",
        position: 0,
        assetsImageName: "IWZombies",
        games: [
            makeInfiniteWarfare()
        ]
    )
}
#endif
