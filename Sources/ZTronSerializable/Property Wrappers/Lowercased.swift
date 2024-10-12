import Foundation

@propertyWrapper
public struct Lowercased {
    private var value: String = ""

    public var wrappedValue: String {
        get { value }
        set { value = newValue.lowercased() }
    }

    public init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.lowercased()
    }
}

@propertyWrapper
public struct NullableLowercased {
    private var value: String? = nil

    public var wrappedValue: String? {
        get { value }
        set { value = newValue?.lowercased() }
    }

    public init(wrappedValue: String?) {
        self.wrappedValue = wrappedValue?.lowercased()
    }
}
