
import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productStar: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    var image: UIImage?
    var title1 = ""
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
        guard let CartVC = storyboard?.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController else { return }
        CartVC.modalPresentationStyle = .overCurrentContext
        self.navigationController?.pushViewController(CartVC, animated: true)
        
    }
    
    @IBAction func pressPurchase(_ sender: UIButton) {
        guard let PurchseVC = storyboard?.instantiateViewController(withIdentifier: "PurchaseViewController") as? PurchaseViewController else { return }
        PurchseVC.productImage1 = image
        PurchseVC.productTitle1 = title1
        PurchseVC.productPrice1 = price
        PurchseVC.modalPresentationStyle = .overCurrentContext
        self.present(PurchseVC, animated: false, completion: nil)
        
    }
    
}
