import Alamofire
import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    var manager: SessionManager
    
    private init() {
        self.manager = Alamofire.SessionManager(configuration: URLSessionConfiguration.default)
    }
}
