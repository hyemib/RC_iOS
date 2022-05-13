
import UIKit

class LoginJoinViewController: UIViewController {

    @IBOutlet weak var logoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoView.layer.cornerRadius = logoView.frame.height / 2

    }
}
