
import UIKit

class OrderViewController: UIViewController {
    
    // 뷰가 메모리에 적재된 시점
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.4)
    }

    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
       
    }
}
