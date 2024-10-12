import Foundation

public enum SerializableException: Error {
    case illegalArgumentException(reason: String)
    case illegalGraphStructureException(reason: String)
    case validationException(reason: String)
}
