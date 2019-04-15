import UIKit

protocol StdMethods {}

extension StdMethods {
    @discardableResult
    func apply(_ block: (Self) -> Void) -> Self {
        block(self)
        
        return self
    }
    
    func `let`<T>(_ block: (Self) -> T) -> T {
        return block(self)
    }
}

extension NSObject: StdMethods {}
extension Double: StdMethods {}
