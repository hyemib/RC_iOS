
import UIKit

protocol HeartDelegate: AnyObject {
    func pressedHeartBtn(for index: Int, like: Bool)
}

class ProductCell: UICollectionViewCell {

    var delegate: HeartDelegate?
    var index: Int?
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var starTitle: UILabel!
    @IBOutlet weak var heartTitle: UILabel!
    @IBOutlet weak var heartBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func pressedHeartBtn(_ sender: UIButton) {
        guard let idx = index else { return }
        if sender.isSelected {
            isTouched = true
            delegate?.pressedHeartBtn(for: idx, like: true)
        } else {
            isTouched = false
            delegate?.pressedHeartBtn(for: idx, like: false)
        }
        sender.isSelected = !sender.isSelected
    }
    
    
    var isTouched: Bool? {
        didSet {
            if isTouched == true {
                heartBtn.tintColor = .systemRed
            } else {
                heartBtn.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
            }
        }
    }
}
