import Foundation

@propertyWrapper struct NullableNormalizedPoint {
    private var value: CGPoint? = nil
    
    var wrappedValue: CGPoint? {
        get { return value }
        set {
            if let newValue = newValue {
                assert(newValue.x >= 0 && newValue.x <= 1, "x is not normalized in \(newValue)")
                assert(newValue.y >= 0 && newValue.y <= 1, "y is not normalized in \(newValue)")
            }
            
            self.value = newValue
        }
    }
    
    init(wrappedValue: CGPoint?) {
        self.wrappedValue = wrappedValue
    }
}
