
import UIKit

class MenuDetailViewController: UIViewController{

    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var drinkTitle: UILabel!
    @IBOutlet weak var drinkPrice: UILabel!
    @IBOutlet weak var drinkImage: UIImageView!
    
    @IBOutlet weak var drinkCount: UILabel!
    
    @IBOutlet weak var icedButton: UIButton!
    @IBOutlet weak var takeout1Button: UIButton!
    @IBOutlet weak var takeout2Button: UIButton!
    @IBOutlet weak var largeButton: UIButton!
    @IBOutlet weak var jumboButton: UIButton!
    
    var title1: String = ""
    var price: String = ""
    var image: UIImage?
    
    var count = 1
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    // 뷰가 메모리에 적재된 시점
    override func viewDidLoad() {
        super.viewDidLoad()

        drinkTitle.text = title1
        drinkPrice.text = price
        drinkImage.image = image

        setNavigationBar()
        buttonCornerRadius()
        pressButton(takeout2Button)
        unPressButton(takeout1Button)
        pressButton(largeButton)
        unPressButton(jumboButton)
    }
    
    // 뷰 컨트롤러가 화면에 나타나기 바로 직전
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(enterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    func setNavigationBar() {
        navigationController?.navigationBar.topItem?.title = ""
        navigationItem.title = "메뉴정보"
        let navigationBarItem = UIBarButtonItem(image: UIImage(named: "cart"), style: .plain, target: self, action: #selector(putCartDrink))
        self.navigationItem.rightBarButtonItem = navigationBarItem
    }
    
    @objc func enterForeground() {
        if (appDelegate?.cartList.count)! > 0 {
            let alertVC = UIAlertController(title: "장바구니에 상품이 있습니다.", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
            NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
        }
    }
    
    @objc func putCartDrink() {
        guard let cartVC = self.storyboard?.instantiateViewController(identifier: "CartViewController") as? CartViewController else { return }
        self.navigationController?.pushViewController(cartVC, animated: true)
    }
    
    func buttonCornerRadius() {
        convertButton.layer.cornerRadius = 15
        icedButton.layer.cornerRadius = 15
        takeout1Button.layer.cornerRadius = 15
        takeout2Button.layer.cornerRadius = 15
        largeButton.layer.cornerRadius = 15
        jumboButton.layer.cornerRadius = 15
    }
    
    @IBAction func pressMinusButton(_ sender: UIButton) {
        if count > 1 {
            count -= 1
        }
        drinkCount.text = "\(count)"
    }
    
    @IBAction func pressPlusButton(_ sender: UIButton) {
        count += 1
        drinkCount.text = "\(count)"
    }
    
    
    
    
    func pressButton(_ button: UIButton) {
        button.layer.borderWidth = 1.5
        button.layer.borderColor = CGColor(red: 0.6863, green: 0, blue: 0.1137, alpha: 1.0)
        button.tintColor = UIColor(red: 0.6863, green: 0, blue: 0.1137, alpha: 1.0)
    }
    
    func unPressButton(_ button: UIButton) {
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.tintColor = .systemGray
        
        
    }
    
    @IBAction func pressTakeout1Button(_ sender: UIButton) {
        pressButton(takeout1Button)
        unPressButton(takeout2Button)
    }
    
    @IBAction func pressTakeout2Button(_ sender: UIButton) {
        pressButton(takeout2Button)
        unPressButton(takeout1Button)
    }
    
    @IBAction func pressLargeButton(_ sender: UIButton) {
        pressButton(largeButton)
        unPressButton(jumboButton)
    }
    
    @IBAction func pressJumboButton(_ sender: UIButton) {
        pressButton(jumboButton)
        unPressButton(largeButton)
    }
    
    @IBAction func pushCartButton(_ sender: UIButton) {
        guard let cartVC = storyboard?.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController else { return }
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.cartList.append(Cart(cartTitle: drinkTitle.text!, cartPrice: drinkPrice.text!, cartCount: count, cartImage: drinkImage.image))
  
        self.navigationController?.pushViewController(cartVC, animated: true)
    }
    
    @IBAction func orderButton(_ sender: UIButton) {
        guard let orderVC = storyboard?.instantiateViewController(withIdentifier: "orderVC") as? OrderViewController else { return }
        
        orderVC.modalPresentationStyle = .overCurrentContext
        self.present(orderVC, animated: false, completion: nil)
    }
}
