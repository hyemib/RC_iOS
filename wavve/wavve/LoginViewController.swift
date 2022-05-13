
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var kakaoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idTextField.layer.cornerRadius = 5
        passTextField.layer.cornerRadius = 5
        loginBtn.layer.cornerRadius = 30
        kakaoView.layer.cornerRadius = kakaoView.frame.width / 2


        
    }
}
