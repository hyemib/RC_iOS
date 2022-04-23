
import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var popupImage: UIImageView!
    
    // 뷰가 메모리에 적재된 시점
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.4)
        
        popupImage.image = [UIImage(named: "randomImg1"),UIImage(named: "randomImg2"),UIImage(named: "randomImg3"),UIImage(named: "randomImg4")][Int.random(in: 0...3)]
    }

    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
}
