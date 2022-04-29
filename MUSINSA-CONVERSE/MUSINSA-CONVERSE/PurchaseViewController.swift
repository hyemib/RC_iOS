
import UIKit

protocol SendDelegate: AnyObject {
    func send(name: String)
}


class PurchaseViewController: UIViewController {
    
    @IBOutlet weak var optionSelectView: UIView!
    @IBOutlet weak var productCount: UILabel!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var cartBtn: UIButton!
    
    var title1: String?
    var price = ""
    var count = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        
        optionSelectView.layer.borderWidth = 1
        productCount.text = "\(count)"
        productPrice.text = price

        cartBtn.layer.borderWidth = 1
        cartBtn.layer.borderColor = UIColor.tintColor.cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let txt = title1 {
            productTitle.text = txt
        }
    }
   
    @IBAction func dismissPopup(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    
    }
    
    @IBAction func PressOption(_ sender: UIButton) {
        guard let PurchseVC = storyboard?.instantiateViewController(withIdentifier: "OptionListViewController") as? OptionListViewController else { return }
        PurchseVC.modalPresentationStyle = .overCurrentContext
        PurchseVC.delegate = self
        self.present(PurchseVC, animated: false, completion: nil)
    }
    
    @IBAction func pressMinusBtn(_ sender: Any) {
        if count > 1 {
            count -= 1
        }
        productCount.text = "\(count)"
        let priceMultipleCount = String(Int(price.filter{$0.isNumber})! * count)
        let totalPrice = "\(priceMultipleCount.prefix(priceMultipleCount.count-3)),\(priceMultipleCount.suffix(3))원"
        productPrice.text = totalPrice
    }
    
    @IBAction func pressPlusBtn(_ sender: Any) {
        count += 1
        productCount.text = "\(count)"
        let priceMultipleCount = String(Int(price.filter{$0.isNumber})! * count)
        let totalPrice = "\(priceMultipleCount.prefix(priceMultipleCount.count-3)),\(priceMultipleCount.suffix(3))원"
        productPrice.text = totalPrice
    }
    
    @IBAction func pressCartBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


extension PurchaseViewController: SendDelegate {
    
    func send(name: String) {
        self.productTitle.text = name
    }
}
