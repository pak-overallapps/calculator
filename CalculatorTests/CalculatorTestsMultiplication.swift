import XCTest
@testable import Calculator

class CalculatorTestsMultiplication: XCTestCase {
    private var operation0: String!
    private var operation1: String!
    private var operation2: String!
    private var operation3: String!
    private var operation4: String!
    private var operation5: String!
    private var operation6: String!
    
    func testMultiplicationPP() {
        // Positive + positive
        self.operation0 = Calculator.shared.didTapClear()
        
        self.operation1 = Calculator.shared.didTap(number: 9)
        self.operation2 = Calculator.shared.didTapMultiply()
        self.operation3 = Calculator.shared.didTap(number: 2)
        self.operation4 = Calculator.shared.didTapEqual()
        
        XCTAssertEqual(self.operation0, "0")
        XCTAssertEqual(self.operation1, "9")
        XCTAssertEqual(self.operation2, "9")
        XCTAssertEqual(self.operation3, "2")
        XCTAssertEqual(self.operation4, "18")
    }
    
    func testMultiplicationPN() {
        // Positive + negative
        self.operation0 = Calculator.shared.didTapClear()
        
        self.operation1 = Calculator.shared.didTap(number: 3)
        self.operation2 = Calculator.shared.didTapMultiply()
        self.operation3 = Calculator.shared.didTap(number: 1)
        self.operation4 = Calculator.shared.didTapPlusMinus()
        self.operation5 = Calculator.shared.didTapEqual()
        
        XCTAssertEqual(self.operation0, "0")
        XCTAssertEqual(self.operation1, "3")
        XCTAssertEqual(self.operation2, "3")
        XCTAssertEqual(self.operation3, "1")
        XCTAssertEqual(self.operation4, "-1")
        XCTAssertEqual(self.operation5, "-3")
    }
    
    func testMultiplicationNN() {
        // Negative + negative
        self.operation0 = Calculator.shared.didTapClear()
        
        self.operation1 = Calculator.shared.didTap(number: 8)
        self.operation2 = Calculator.shared.didTapPlusMinus()
        self.operation3 = Calculator.shared.didTapMultiply()
        self.operation4 = Calculator.shared.didTap(number: 2)
        self.operation5 = Calculator.shared.didTapPlusMinus()
        self.operation6 = Calculator.shared.didTapEqual()
        
        XCTAssertEqual(self.operation0, "0")
        XCTAssertEqual(self.operation1, "8")
        XCTAssertEqual(self.operation2, "-8")
        XCTAssertEqual(self.operation3, "-8")
        XCTAssertEqual(self.operation4, "2")
        XCTAssertEqual(self.operation5, "-2")
        XCTAssertEqual(self.operation6, "16")
    }
}
