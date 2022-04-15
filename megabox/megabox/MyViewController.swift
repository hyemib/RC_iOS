
import UIKit

class MyViewController: UIViewController {
   
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var nonmemberBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginBtn.layer.cornerRadius = 5
        nonmemberBtn.layer.cornerRadius = 5
    }
}
