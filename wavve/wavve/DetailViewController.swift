
import UIKit

class DetailViewController: UIViewController {

    var dataName = ""
    var dataImage = ""
    var dataOverview = ""
    var dataDate = ""
    
    @IBOutlet weak var contentsName: UILabel!
    @IBOutlet weak var contentsImage: UIImageView!
    @IBOutlet weak var contentsOverview: UILabel!
    @IBOutlet weak var contentsDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentsName.text = dataName
        let url = URL(string: "https://image.tmdb.org/t/p/w500/"+dataImage)
        if let data = try? Data(contentsOf: url!) {
            if let image = UIImage(data: data) {
                contentsImage.image = image
            }
        }
        contentsOverview.text = dataOverview
        contentsDate.text = dataDate
    }

    @IBAction func returnButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
}
