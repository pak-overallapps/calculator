import UIKit

class OperatorSquare: UIButton {
    
    private var onTap: (() -> Void)?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported")
    }
    
    init(text: String, onTap: (() -> Void)?) {
        super.init(frame: .zero)
        
        self.onTap = onTap
        
        self.backgroundColor = .blue
        
        self.setTitle(text, for: .normal)
        
        self.clipsToBounds = true
        
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        
        self.addTarget(self, action: #selector(self.didTap), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.frame.height / 2
    }
    
    @objc private func didTap() {
        self.onTap?()
    }

}
