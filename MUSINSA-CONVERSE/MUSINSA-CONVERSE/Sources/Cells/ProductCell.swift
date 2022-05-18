
import UIKit

protocol HeartDelegate: AnyObject {
    func pressedHeartBtn(for index: Int, like: Bool)
}

class ProductCell: UICollectionViewCell {

    var data = Data.shared
    var delegate: HeartDelegate?
    var index: Int?
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var starTitle: UILabel!
    @IBOutlet weak var starStackView: UIStackView!
    @IBOutlet weak var heartTitle: UILabel!
    @IBOutlet weak var heartBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func pressedHeartBtn(_ sender: UIButton) {
        guard let idx = index else { return }
        if sender.isSelected {
            isTouched = true
            likeList.add(imageName: data.HomeData[3][idx].imageName, title: data.HomeData[3][idx].title ?? "", price: data.HomeData[3][idx].price ?? "", starCount: data.HomeData[3][idx].starCount ?? "", heartCount: data.HomeData[3][idx].heartCount ?? "", like: true)
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
