
import UIKit

protocol HeaderViewDelegate: AnyObject {
    func pressedXBtn(for index: Int)
    func pressedPlusBtn(for index: Int)
    func pressedMinusBtn(for index: Int)
}

class CartListTableViewCell2: UITableViewCell {
    
    var delegate: HeaderViewDelegate?
    var index: Int?
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productSize: UILabel!
    @IBOutlet weak var productCount: UILabel!
    @IBOutlet weak var productPrice: UILabel!
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func pressedXBtn(_ sender: Any) {
        guard let idx = index else {return}
        delegate?.pressedXBtn(for: idx)
    }
    
    @IBAction func pressedPlusBtn(_ sender: UIButton) {
        guard let idx = index else {return}
        delegate?.pressedPlusBtn(for: idx)
    }
    
    @IBAction func pressedMinusBtn(_ sender: UIButton) {
        guard let idx = index else {return}
        delegate?.pressedMinusBtn(for: idx)
    }
    
}
