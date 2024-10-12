import Foundation

@propertyWrapper struct NormalizedReal {
    private var value: Double = 0.0
    
    var wrappedValue: Double {
        get { return value }
        set {
            assert(newValue >= 0.0 && newValue <= 1.0, "x is not normalized in \(newValue)")
            
            self.value = newValue
        }
    }
    
    init(wrappedValue: Double) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper struct NullableNormalizedReal {
    private var value: Double? = nil
    
    var wrappedValue: Double? {
        get { return value }
        set {
            if let newValueAsDouble = newValue {
                assert(newValueAsDouble >= 0.0 && newValueAsDouble <= 1.0, "x is not normalized in \(newValueAsDouble)")
            }
            
            self.value = newValue
        }
    }
    
    init(wrappedValue: Double?) {
        self.wrappedValue = wrappedValue
    }
}
