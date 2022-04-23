
import UIKit

class CartViewController: UIViewController{

    @IBOutlet weak var cartTitle1: UILabel!
    @IBOutlet weak var cartPrice1: UILabel!
    @IBOutlet weak var cartImage1: UIImageView!
    
    @IBOutlet weak var cartTitle2: UILabel!
    @IBOutlet weak var cartPrice2: UILabel!
    @IBOutlet weak var cartImage2: UIImageView!
    
    @IBOutlet weak var emptyCart: UILabel!
    
    @IBOutlet weak var cartTotalCount: UILabel!
    @IBOutlet weak var cartTotalPrice: UILabel!
    
    var totalPrice = 0
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    // 뷰가 메모리에 적재된 시점
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setCart()
    }
    
    func setNavigationBar() {
        navigationController?.navigationBar.topItem?.title = ""
        navigationItem.title = "장바구니"
        let navigationRightBarItem = UIBarButtonItem(image: UIImage(named: "house"), style: .plain, target: self, action: #selector(moveMainView))
        self.navigationItem.rightBarButtonItem = navigationRightBarItem
    }
    
    func setCart() {
        if appDelegate?.cartList.count == 0 {
            emptyCart.text = "장바구니가 비어 있습니다."
            cartTitle1.text = ""
            cartPrice1.text = ""
            cartTitle2.text = ""
            cartPrice2.text = ""
            
        } else if appDelegate?.cartList.count == 1 {
            emptyCart.text = ""
            setCartView(1)
            
            cartTitle2.text = ""
            cartPrice2.text = ""
            
        } else if (appDelegate?.cartList.count)! >= 2 {
            setCartView(1)
            setCartView(2)
        }
    }
    
    @objc func moveMainView() {
        guard let mainVC = storyboard?.instantiateViewController(withIdentifier: "mainVC") as? ViewController else { return }
        
        mainVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(mainVC, animated: true)
    }

    func setCartView(_ viewNum: Int) {
        let cartTitleArray = [cartTitle1, cartTitle2]
        let cartPriceArray = [cartPrice1, cartPrice2]
        let cartImageArray = [cartImage1, cartImage2]
        cartTitleArray[viewNum-1]?.text = appDelegate?.cartList[viewNum-1].cartTitle
        
        let countMultiplePrice = Int(appDelegate!.cartList[viewNum-1].cartPrice.filter{$0.isNumber})! * (appDelegate?.cartList[viewNum-1].cartCount)!
        cartPriceArray[viewNum-1]?.text = "\(String(countMultiplePrice).prefix(String(countMultiplePrice).count-3)+","+String(countMultiplePrice).suffix(3))원"
        cartImageArray[viewNum-1]?.image = appDelegate?.cartList[viewNum-1].cartImage
        
        cartTotalCount.text = "음료(\(viewNum))"
        
        totalPrice += countMultiplePrice
        cartTotalPrice.text = "\(String(totalPrice).prefix(String(totalPrice).count-3)+","+String(totalPrice).suffix(3))원"
    }
    
    func cartRemoveAll() {
        cartTitle1.text = ""
        cartPrice1.text = ""
        cartImage1.image = UIImage(named: "")
        cartTitle2.text = ""
        cartPrice2.text = ""
        cartImage2.image = UIImage(named: "")
        emptyCart.text = "장바구니가 비어 있습니다."
        cartTotalCount.text = "음료(0)"
        cartTotalPrice.text = " "
        
        appDelegate?.cartList.removeAll()
    }
    
    @IBAction func cartRemoveAll(_ sender: UIButton) {
        cartRemoveAll()
    }
    
    @IBAction func orderButton(_ sender: UIButton) {
        if appDelegate?.cartList.count == 0 {
            let alertVC = UIAlertController(title: "주문할 상품이 없습니다.", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
        } else {
            guard let orderVC = storyboard?.instantiateViewController(withIdentifier: "orderVC") as? OrderViewController else { return }
            
            orderVC.modalPresentationStyle = .overCurrentContext
            cartRemoveAll()
            self.present(orderVC, animated: false, completion: nil)
        }
    }
    
}
