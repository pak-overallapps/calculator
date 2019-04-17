import UIKit

class CalculatorViewController: UIViewController {
    
    private var titleView = UILabel().apply {
        $0.backgroundColor = .clear
        $0.textAlignment = .center
        $0.text = "Over-engineered calculator"
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private var display = Display().apply {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var operatorGrid = OperatorGrid().apply {
        $0.backgroundColor = .clear
        $0.gridDelegate = self
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViews()
        self.setupConstraints()
        
        self.fetchSavedData()
    }
    
    private func fetchSavedData() {
        // TODO: Handle disposable
        _ = CalculatorAPI.get()
            .subscribe(onNext: { (json) in
                print("CalculatorVC GET succeeded:\n\(json.prettyPrintedString())")
            }, onError: { (error) in
                print("CalculatorVC GET failed:\n\(error)")
            }, onCompleted: {
                print("CalculatorVC GET completed")
            }, onDisposed: {
                print("CalculatorVC GET disposed")
            })
    }
    
    private func postResult(result: String) {
        // TODO: Handle disposable
        _ = CalculatorAPI.post(result: result)
            .subscribe(onNext: { (json) in
                print("CalculatorVC POST succeeded:\n\(json.prettyPrintedString())")
            }, onError: { (error) in
                print("CalculatorVC POST failed:\n\(error)")
            }, onCompleted: {
                print("CalculatorVC POST completed")
            }, onDisposed: {
                print("CalculatorVC POST disposed")
            })
    }
}

// MARK: - Operator grid delegates
extension CalculatorViewController: OperatorGridDelegate {
    func didTap(number: Int) {
        let result = Calculator.shared.didTap(number: number)
        
        self.display.set(result: result)
    }
    
    func didTapClear() {
        let result = Calculator.shared.didTapClear()
        
        self.display.set(result: result)
    }
    
    func didTapPlusMinus() {
        let result = Calculator.shared.didTapPlusMinus()
        
        self.display.set(result: result)
    }
    
    func didTapPercentage() {
        let result = Calculator.shared.didTapPercentage()
        
        self.display.set(result: result)
    }
    
    func didTapDivide() {
        let result = Calculator.shared.didTapDivide()
        
        self.display.set(result: result)
    }
    
    func didTapMultiply() {
        let result = Calculator.shared.didTapMultiply()
        
        self.display.set(result: result)
    }
    
    func didTapSubtraction() {
        let result = Calculator.shared.didTapSubtraction()
        
        self.display.set(result: result)
    }
    
    func didTapAddition() {
        let result = Calculator.shared.didTapAddition()
        
        self.display.set(result: result)
    }
    
    func didTapDot() {
        let result = Calculator.shared.didTapDot()
        
        self.display.set(result: result)
    }
    
    func didTapEqual() {
        let result = Calculator.shared.didTapEqual()
        
        self.display.set(result: result)
        
        // TODO POST result
//        self.postResult(result: result)
    }
}

// MARK: - UI
extension CalculatorViewController {
    private func setupViews() {
        self.edgesForExtendedLayout = .all
        self.extendedLayoutIncludesOpaqueBars = true
        
        self.view.backgroundColor = .black
        
        self.view.addSubview(self.titleView)
        self.view.addSubview(self.display)
        self.view.addSubview(self.operatorGrid)
    }
    
    private func setupConstraints() {
        self.titleView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        self.titleView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.titleView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        
        self.display.topAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: 20).isActive = true
        self.display.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.display.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.display.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.operatorGrid.topAnchor.constraint(equalTo: self.display.bottomAnchor).isActive = true
        self.operatorGrid.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        self.operatorGrid.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.operatorGrid.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        
        self.operatorGrid.widthAnchor.constraint(equalTo: self.operatorGrid.heightAnchor, multiplier: 4 / 5).isActive = true
    }
}
