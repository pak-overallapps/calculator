import UIKit

class CalculatorViewController: UIViewController {
    
    private var titleView = UILabel().apply {
        $0.backgroundColor = .green
        $0.textAlignment = .center
        $0.text = "Over-engineered calculator"
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private var display = Display().apply {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private var operatorGrid = OperatorGrid().apply {
        $0.backgroundColor = .purple
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViews()
        self.setupConstraints()
    }
}

// MARK: - UI
extension CalculatorViewController {
    private func setupViews() {
        self.edgesForExtendedLayout = .all
        self.extendedLayoutIncludesOpaqueBars = true
        
        self.view.backgroundColor = .red
        
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
