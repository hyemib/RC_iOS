
import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productStar: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    var image: UIImage?
    var title1: String = ""
    var price = ""
    var star = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productImg.image = image
        productTitle.text = title1
        productPrice.text = price
        productStar.text = star
        
        let backButtonItem = UIBarButtonItem()
        backButtonItem.tintColor = .black
        backButtonItem.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButtonItem
        let navigationBarItem = UIBarButtonItem(image: UIImage(named: "bag2"), style: .plain, target: self, action: #selector(moveCart))
        navigationBarItem.tintColor = .black
                self.navigationItem.rightBarButtonItem = navigationBarItem
    }

    
    @objc func moveCart() {
        
    }
}
