import Foundation

public enum SerializableException: Error {
    case illegalArgumentException(reason: String)
    case illegalGraphStructureException(reason: String)
    case validationException(reason: String)
    case invalidForeignKeyException(reason: ForeignKey)
}

public enum ForeignKey: Sendable {
    case studio
    case game
    case map
    case tab
    case tool
    case gallery
    case image
}
