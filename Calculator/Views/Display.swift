import UIKit

class Display: UIView {
    
    private let resultLabel = UILabel().apply {
        $0.backgroundColor = .clear
        $0.textAlignment = .right
        $0.text = "0"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 58)
        $0.adjustsFontSizeToFitWidth = true
        $0.minimumScaleFactor = 0.2
        $0.lineBreakMode = .byTruncatingMiddle
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported")
    }
    
    init() {
        super.init(frame: .zero)
        
        self.setupViews()
        self.setupConstraints()
    }
    
    func set(result: String) {
        self.resultLabel.text = result
    }
}

// MARK: - UI
extension Display {
    private func setupViews() {
        self.backgroundColor = .clear
        
        self.addSubview(self.resultLabel)
    }
    
    private func setupConstraints() {
        self.resultLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        self.resultLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 24).isActive = true
        self.resultLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
    }
}
