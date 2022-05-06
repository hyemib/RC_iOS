
import UIKit

class ManualViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closedManual(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
