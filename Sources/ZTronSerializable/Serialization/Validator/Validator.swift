import Foundation
import os

/// Contains utility validators to enforce constraints that are not trigger-checked at time of insertion.
public final class Validator: Sendable {
    internal static let logger = os.Logger(subsystem: "ZTronSerializable", category: "Validator")
    
    private init() { }
}
