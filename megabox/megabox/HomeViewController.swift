
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var firstCellImage1: UIImageView!
    @IBOutlet weak var firstCellImage2: UIImageView!
    @IBOutlet weak var firstCellImage3: UIImageView!
    @IBOutlet weak var firstCellImage4: UIImageView!
    @IBOutlet weak var firstCellImage5: UIImageView!
    
    @IBOutlet weak var movieView: UIView!
    @IBOutlet weak var reservationBtn1: UIButton!
    @IBOutlet weak var age1: UIView!
    @IBOutlet weak var reservationBtn2: UIButton!
    @IBOutlet weak var age2: UIView!
    @IBOutlet weak var reservationBtn3: UIButton!
    @IBOutlet weak var age3: UIView!
    
    @IBOutlet weak var movieFeedImage: UIImageView!
    
    @IBOutlet weak var movieFeedView1: UIView!
    @IBOutlet weak var movieFeedImage2: UIImageView!
    @IBOutlet weak var movieFeedView2: UIView!

    @IBOutlet weak var movieFeedImage3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar()
        objectShape()
        
    }
    
    func navigationBar() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logo")
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
    func objectShape() {
        firstCellImage1.layer.borderWidth = 1.5
        firstCellImage1.layer.borderColor = UIColor.systemMint.cgColor
        
        firstCellImage1.layer.cornerRadius = 35
        firstCellImage2.layer.cornerRadius = 35
        firstCellImage3.layer.cornerRadius = 35
        firstCellImage4.layer.cornerRadius = 35
        firstCellImage5.layer.cornerRadius = 35
        
        movieView.layer.cornerRadius = 20
        movieView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        reservationBtn1.layer.cornerRadius = 10
        age1.layer.cornerRadius = 10
        reservationBtn2.layer.cornerRadius = 10
        age2.layer.cornerRadius = 10
        reservationBtn3.layer.cornerRadius = 10
        age3.layer.cornerRadius = 10
        
        movieFeedImage.layer.cornerRadius = 10
        movieFeedImage2.layer.cornerRadius = 10
        movieFeedImage3.layer.cornerRadius = 10
    }
}
