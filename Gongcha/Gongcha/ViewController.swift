
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var adImage: UIImageView!
    @IBOutlet weak var adPageControl: UIPageControl!
    
    var adImages = ["ad1.jpeg", "ad2.jpeg", "ad3.jpeg"]
    
    // 뷰가 메모리에 적재된 시점
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setPageControl()
    }
    
    // 뷰 컨트롤러가 화면에 나타나기 바로 직전
    override func viewWillAppear(_ animated: Bool) {
        guard let popupVC = storyboard?.instantiateViewController(withIdentifier: "popupVC") as? PopupViewController else { return }
        
        popupVC.modalPresentationStyle = .overCurrentContext
        self.present(popupVC, animated: false, completion: nil)
    }
    
    func setNavigationBar() {
        let logo = UIImageView(image: UIImage(named: "logo"))
        logo.contentMode = .scaleAspectFit
        logo.widthAnchor.constraint(equalToConstant: 140).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        navigationItem.titleView = logo
    }
    
    func setPageControl() {
        adPageControl.numberOfPages = adImages.count
        adPageControl.currentPage = 0
        adImage.image = UIImage(named: adImages[0])
    }
    
    @IBAction func adPageChanged(_ sender: UIPageControl) {
        adImage.image = UIImage(named: adImages[adPageControl.currentPage])
    }
    
}

