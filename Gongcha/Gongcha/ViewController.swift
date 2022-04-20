
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var adImage: UIImageView!
    @IBOutlet weak var adPageControl: UIPageControl!
    var adImages = ["ad1.jpeg", "ad2.jpeg", "ad3.jpeg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar()
        pageControl()
    }
    
    func navigationBar() {
        let logo = UIImageView(image: UIImage(named: "logo"))
        logo.contentMode = .scaleAspectFit
        logo.widthAnchor.constraint(equalToConstant: 140).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        navigationItem.titleView = logo
    }
    
    func pageControl() {
        adPageControl.numberOfPages = adImages.count
        adPageControl.currentPage = 0
        adImage.image = UIImage(named: adImages[0])
    }
    
    @IBAction func adPageChanged(_ sender: UIPageControl) {
        adImage.image = UIImage(named: adImages[adPageControl.currentPage])
    }
    
}

