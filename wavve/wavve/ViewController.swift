
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var subBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subBtn.layer.cornerRadius = 5
    }
    
    @IBAction func moveLoginView(_ sender: Any) {
        guard let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: false)
    }
}

