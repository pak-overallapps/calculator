import UIKit

class OperatorGrid: UIView {
    
    private let verticalStackView = UIStackView().apply {
        $0.distribution = .fillEqually
        $0.axis = .vertical
        $0.spacing = 4
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let horizontalStackView1 = UIStackView().apply {
        $0.distribution = .fillEqually
        $0.axis = .horizontal
        $0.spacing = 4
    }
    private let horizontalStackView2 = UIStackView().apply {
        $0.distribution = .fillEqually
        $0.axis = .horizontal
        $0.spacing = 4
    }
    private let horizontalStackView3 = UIStackView().apply {
        $0.distribution = .fillEqually
        $0.axis = .horizontal
        $0.spacing = 4
    }
    private let horizontalStackView4 = UIStackView().apply {
        $0.distribution = .fillEqually
        $0.axis = .horizontal
        $0.spacing = 4
    }
    private let horizontalStackView5 = UIStackView().apply {
        $0.distribution = .fillProportionally
        $0.axis = .horizontal
        $0.spacing = 4
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupViews()
        self.setupConstraints()
        
        self.generateOperators()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported")
    }
    
    private func generateOperators() {
        for index in 0...9 {
            let _operator = OperatorSquare(text: "\(index)")

            let stackView: UIStackView
            if index == 0 {
                stackView = self.horizontalStackView5
            } else if 1...3 ~= index {
                stackView = self.horizontalStackView4
            } else if 4...6 ~= index {
                stackView = self.horizontalStackView3
            } else {
                stackView = self.horizontalStackView2
            }
            
            stackView.addArrangedSubview(_operator)
        }
        
        let clear = OperatorSquare(text: "C")
        let plusMinus = OperatorSquare(text: "\u{B1}")
        let percentage = OperatorSquare(text: "\u{25}")
        let divide = OperatorSquare(text: "\u{F7}")
        let multiply = OperatorSquare(text: "\u{D7}")
        let subtraction = OperatorSquare(text: "\u{2212}")
        let addition = OperatorSquare(text: "\u{2B}")
        let dot = OperatorSquare(text: "\u{22C5}")
        let equal = OperatorSquare(text: "\u{3D}")
        
        self.horizontalStackView1.addArrangedSubview(clear)
        self.horizontalStackView1.addArrangedSubview(plusMinus)
        self.horizontalStackView1.addArrangedSubview(percentage)
        self.horizontalStackView1.addArrangedSubview(divide)
        self.horizontalStackView2.addArrangedSubview(multiply)
        self.horizontalStackView3.addArrangedSubview(subtraction)
        self.horizontalStackView4.addArrangedSubview(addition)
        self.horizontalStackView5.addArrangedSubview(dot)
        self.horizontalStackView5.addArrangedSubview(equal)
        
        if let operator0 = self.horizontalStackView5.arrangedSubviews.first {
            dot.widthAnchor.constraint(equalTo: operator0.widthAnchor, multiplier: 0.5).isActive = true
            equal.widthAnchor.constraint(equalTo: operator0.widthAnchor, multiplier: 0.5).isActive = true
        }
    }
}

// MARK: - UI
extension OperatorGrid {
    private func setupViews() {
        self.addSubview(self.verticalStackView)
        
        self.verticalStackView.addArrangedSubview(self.horizontalStackView1)
        self.verticalStackView.addArrangedSubview(self.horizontalStackView2)
        self.verticalStackView.addArrangedSubview(self.horizontalStackView3)
        self.verticalStackView.addArrangedSubview(self.horizontalStackView4)
        self.verticalStackView.addArrangedSubview(self.horizontalStackView5)
    }
    
    private func setupConstraints() {
        self.verticalStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}

