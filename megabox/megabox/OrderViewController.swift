

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var mobileOrderView: UIView!
    @IBOutlet weak var simpleOrder: UIView!
    @IBOutlet weak var drinkView: UIView!
    @IBOutlet weak var orderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mobileOrderView.layer.cornerRadius = 10
        simpleOrder.layer.cornerRadius = 10
        drinkView.layer.cornerRadius = 30
        orderView.layer.cornerRadius = 30
    }
}
