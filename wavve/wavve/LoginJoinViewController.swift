
import UIKit

protocol SendDelegate: AnyObject {
    func send(name: String)
}

class LoginJoinViewController: UIViewController {

    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var nickname: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoView.layer.cornerRadius = logoView.frame.height / 2
        logoutBtn.isHidden = true

    }
    
    @IBAction func moveLogin(_ sender: Any) {
        guard let loginVC = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as? LoginViewController else { return }
        loginVC.modalPresentationStyle = .fullScreen
        loginVC.delegate = self
        self.present(loginVC, animated: false, completion: nil)
    }

}

extension LoginJoinViewController: SendDelegate {
    func send(name: String) {
        self.nickname.text = name
    }
}
