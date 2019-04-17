import UIKit

enum OperatorSquareTheme {
    case gray
    case black
    case orange
}

class OperatorSquare: UIButton {
    
    private var onTap: (() -> Void)?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported")
    }
    
    init(theme: OperatorSquareTheme, text: String, onTap: (() -> Void)?) {
        super.init(frame: .zero)
        
        self.onTap = onTap
        
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 26)
        
        self.clipsToBounds = true
        
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        
        self.addTarget(self, action: #selector(self.didTap), for: .touchUpInside)
        
        switch theme {
        case .gray:
            self.backgroundColor = .gray
            self.setTitleColor(.black, for: .normal)
        case .black:
            self.backgroundColor = UIColor.white.withAlphaComponent(0.2)
            self.setTitleColor(.white, for: .normal)
        case .orange:
            self.backgroundColor = .orange
            self.setTitleColor(.white, for: .normal)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.frame.height / 2
    }
    
    @objc private func didTap() {
        self.onTap?()
    }

}
