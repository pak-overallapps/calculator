import Alamofire
import RxAlamofire
import RxSwift
import SwiftyJSON

class CalculatorAPI {
    
    class func get() -> Observable<JSON> {
        let urlComponents = RequestBuilder.getApiComponents(path: "/name/patrick/result/45", queryItems: nil)
        
        let manager = NetworkManager.shared.manager
        return manager.rx.request(.get, urlComponents.url!, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .flatMap {
                $0
                    .validate(statusCode: 200 ..< 300)
                    .validate(contentType: ["application/json"])
                    .rx.json()
            }
            .map { data in
                return JSON(data)
        }
    }
    
    class func post(result: String) -> Observable<JSON> {
        let requestData : [String: Any] = [
            "key" : result,
        ]
        
        let urlComponents = RequestBuilder.getApiComponents(path: "/endpoint", queryItems: nil)
        
        let manager = NetworkManager.shared.manager
        return manager.rx.request(.post, urlComponents.url!, parameters: requestData, encoding: JSONEncoding.default, headers: nil)
            .flatMap {
                $0
                    .validate(statusCode: 200 ..< 300)
                    .validate(contentType: ["application/json"])
                    .rx.json()
            }
            .map { data in
                return JSON(data)
        }
    }
}
