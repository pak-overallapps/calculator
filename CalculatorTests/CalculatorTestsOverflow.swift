import XCTest
@testable import Calculator

class CalculatorTestsOverflow: XCTestCase {
    
    func testInputOverflow() {
        // Overflowing when typing numbers
        let operation0 = Calculator.shared.didTapClear()
        
        XCTAssertEqual(operation0, "0")
        
        // Double overflows at: 9.007.199.254.740.992. Testing overflow at 9 times 16
        for i in 1...16 {
            let operationN = Calculator.shared.didTap(number: 9)
            
            let expected = String(repeating: "9", count: i)

            XCTAssertEqual(operationN, expected)
        }
    }
    
    func testAdditionOverflow() {
        // TODO
    }
    
    func testSubtractionOverflow() {
        // TODO
    }
    
    func testMultiplicationOverflow() {
        // TODO
    }
    
    func testDivisionOverflow() {
        // TODO
    }
}
