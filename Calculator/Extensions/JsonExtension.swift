import SwiftyJSON

extension JSON {
    func prettyPrintedString() -> String {
        return String(data: try! JSONSerialization.data(withJSONObject: self.dictionaryObject!, options: .prettyPrinted), encoding: .utf8)!
    }
}
