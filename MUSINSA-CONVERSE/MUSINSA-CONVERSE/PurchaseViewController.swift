
import UIKit

protocol SendDelegate: AnyObject {
    func send(name: String)
}

extension PurchaseViewController: SendDelegate {
    func send(name: String) {
        self.productSize.text = name
    }
}

class PurchaseViewController: UIViewController {
    
    @IBOutlet weak var optionSelectView: UIView!
    @IBOutlet weak var productCount: UILabel!
    @IBOutlet weak var productSize: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var cartBtn: UIButton!
    
    var productImage1: UIImage?
    var productTitle1 = ""
    var productSize1 = ""
    var productPrice1 = ""
    var productCount1 = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        
        optionSelectView.layer.borderWidth = 1
        productCount.text = "\(productCount1 )"
        productPrice.text = productPrice1

        cartBtn.layer.borderWidth = 1
        cartBtn.layer.borderColor = UIColor.tintColor.cgColor
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
        
        if productCount1  > 1 {
            productCount1  -= 1
        }
        productCount.text = "\(productCount1 )"
        let priceMultipleCount = String(Int(productPrice1.filter{$0.isNumber})! * productCount1 )
        let totalPrice = "\(priceMultipleCount.prefix(priceMultipleCount.count-3)),\(priceMultipleCount.suffix(3))원"
        productPrice.text = totalPrice
        
    }
    
    @IBAction func pressPlusBtn(_ sender: Any) {
        productCount1  += 1
        productCount.text = "\(productCount1)"
        let priceMultipleCount = String(Int(productPrice1.filter{$0.isNumber})! * productCount1 )
        let totalPrice = "\(priceMultipleCount.prefix(priceMultipleCount.count-3)),\(priceMultipleCount.suffix(3))원"
        productPrice.text = totalPrice
    }
    
    @IBAction func pressCartBtn(_ sender: Any) {
        if productSize.text != "" {
            cartList.add(image: productImage1, title: productTitle1, size: productSize.text ?? "", price: productPrice1, count: String(productCount1 ))
            let alertVC = UIAlertController(title: "장바구니에 상품이 담겼습니다.", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
        } else {
            let alertVC = UIAlertController(title: "옵션을 선택해 주세요.", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
        }
    }
    
}



