import RxSwift

extension ConcurrentDispatchQueueScheduler {
    
    static var background: ConcurrentDispatchQueueScheduler {
        return ConcurrentDispatchQueueScheduler(queue:
            DispatchQueue(label: "com.calculator.concurrent.queue", qos: .default, attributes: DispatchQueue.Attributes.concurrent)
        )
    }
}
