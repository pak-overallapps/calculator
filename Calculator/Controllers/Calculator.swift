import Foundation

enum CalculatorOperation {
    case add
    case subtract
    case multiply
    case divide
}

class Calculator {
    
    static let shared = Calculator()
    
    private init() {}
    
    var currentNumber: Double?
    var previousNumber: Double?
    var operation: CalculatorOperation?
    
    func didTap(number: Int) -> String {
        var numberString: String = ""
        self.currentNumber?.let {
            numberString += self.formatter(number: Double($0))
        }
        numberString += self.formatter(number: Double(number))
        
        let result = Double(numberString)
        
        self.currentNumber = result
        
        return self.formatter(number: result)
    }
    
    func didTapClear() -> String {
        self.clear()
        
        return self.formatter(number: 0)
    }
    
    func didTapPlusMinus() -> String {
        let result = (self.currentNumber ?? 0) * -1
        
        self.currentNumber = result
        
        return self.formatter(number: result)
    }
    
    func didTapPercentage() -> String {
        let result = (self.currentNumber ?? 0) / 100
        
        self.currentNumber = result
        
        return self.formatter(number: result)
    }
    
    func didTapDivide() -> String {
        self.previousNumber = self.currentNumber
        self.currentNumber = nil
        
        self.operation = .divide
        
        return self.formatter(number: self.previousNumber ?? 0)
    }
    
    func didTapMultiply() -> String {
        self.previousNumber = self.currentNumber
        self.currentNumber = nil
        
        self.operation = .multiply
        
        return self.formatter(number: self.previousNumber ?? 0)
    }
    
    func didTapSubtraction() -> String {
        self.previousNumber = self.currentNumber
        self.currentNumber = nil
        
        self.operation = .subtract
        
        return self.formatter(number: self.previousNumber ?? 0)
    }
    
    func didTapAddition() -> String {
        self.previousNumber = self.currentNumber
        self.currentNumber = nil
        
        self.operation = .add
        
        return self.formatter(number: self.previousNumber ?? 0)
    }
    
    func didTapDot() -> String {
        debugPrint("Calculator: didTapDot")
        
        return "" // TODO
    }
    
    func didTapEqual() -> String {
        let result = self.getResult()
        
        self.clear()
        
        return self.formatter(number: result)
    }
    
    // MARK: - Private helpers
    private func clear() {
        self.currentNumber = nil
        self.previousNumber = nil
        
        self.operation = nil
    }
    
    private func getResult() -> Double? {
        guard let _operation = self.operation else {
            return nil
        }
        
        let _previousNumber = (self.previousNumber ?? 0)
        let _currentNumber = (self.currentNumber ?? 0)
        
        switch _operation {
        case .add:
            return _previousNumber + _currentNumber
        case .subtract:
            return _previousNumber - _currentNumber
        case .multiply:
            return _previousNumber * _currentNumber
        case .divide:
            if _currentNumber == 0 {
                return nil
            }
            return _previousNumber / _currentNumber
        }
    }
    
    private func formatter(number: Double?) -> String {
        guard let _number = number else {
            return "Not a number"
        }
        
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = false
        formatter.numberStyle = .decimal
        formatter.locale = Locale.current
        
        let nsNumber = NSNumber(value: _number)
        return formatter.string(from: nsNumber)!
    }
}
