import Foundation

@propertyWrapper struct ColorHex {
    private var value: String = "#1A1B1B"
    
    var wrappedValue: String {
        get { return value }
        set {
            assert(isValidHexColor(newValue), "\(newValue) is not a valid Hex color representation.")
            self.value = newValue
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.lowercased()
    }
}

/// Validates an String as an hex color.
///
/// A string is considered to be a valid color hex if it meets all the following conditions:
/// - It starts with `#`
/// - The `#` is followed by either 3 or 6 characters
/// - All of the latter are valid hex digits.
///
/// - Returns: `true` if `hex` is a valid color hex string representation, `false` otherwise
/// - Parameter hex: The string to validate
/// - Complexity: O(hex.count) if `hex` is a valid
public func isValidHexColor(_ hex: String) -> Bool {
    if hex.first != "#" {
        return false
    } else {
        if hex.count != 4 && hex.count != 7 {
            return false
        } else {
            var expectedFirstHexDigitIndex = hex.startIndex
            _ = hex.formIndex(&expectedFirstHexDigitIndex, offsetBy: 1, limitedBy: hex.endIndex)
            return hex.suffix(from: expectedFirstHexDigitIndex).allSatisfy(\.isHexDigit)
        }
    }
}
