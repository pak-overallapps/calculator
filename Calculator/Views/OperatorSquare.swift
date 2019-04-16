import UIKit

class OperatorSquare: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported")
    }
    
    init(text: String) {
        super.init(frame: .zero)
        
        self.backgroundColor = .blue
        
        self.text = text
        self.textAlignment = .center
        
        self.clipsToBounds = true
        
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.frame.height / 2
    }

}
