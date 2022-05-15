
import UIKit

class LoginJoinViewController: UIViewController {

    @IBOutlet weak var logoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoView.layer.cornerRadius = logoView.frame.height / 2

    }
    
    @IBAction func moveLogin(_ sender: Any) {
        guard let loginVC = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as? LoginViewController else { return }
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: false, completion: nil)
    }
}
