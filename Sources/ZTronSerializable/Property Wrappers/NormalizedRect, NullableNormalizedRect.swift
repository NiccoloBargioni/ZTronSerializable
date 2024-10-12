import Foundation

@propertyWrapper struct NormalizedRect {
    private var value: CGRect = CGRect(x: 0, y: 0, width: 1.0, height: 1.0)
    
    var wrappedValue: CGRect {
        get { return value }
        set {
            assert(newValue.origin.x >= 0 && newValue.origin.x <= 1, "x is not normalized in \(newValue)")
            assert(newValue.origin.y >= 0 && newValue.origin.y <= 1, "y is not normalized in \(newValue)")
            assert(newValue.width >= 0 && newValue.width <= 1, "width is not normalized in \(newValue)")
            assert(newValue.height >= 0 && newValue.height <= 1, "height is not normalized in \(newValue)")
            self.value = newValue
        }
    }
    
    init(wrappedValue: CGRect) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper struct NullableNormalizedRect {
    private var value: CGRect? = nil
    
    var wrappedValue: CGRect? {
        get { return value }
        set {
            if let newValue = newValue {
                assert(newValue.origin.x >= 0 && newValue.origin.x <= 1, "x is not normalized in \(newValue)")
                assert(newValue.origin.y >= 0 && newValue.origin.y <= 1, "y is not normalized in \(newValue)")
                assert(newValue.width >= 0 && newValue.width <= 1, "width is not normalized in \(newValue)")
                assert(newValue.height >= 0 && newValue.height <= 1, "height is not normalized in \(newValue)")
            }
            
            self.value = newValue
        }
    }
    
    init(wrappedValue: CGRect?) {
        self.wrappedValue = wrappedValue
    }
}


