
import UIKit

class IntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func startButtonClicked(_ sender: UIButton) {
        //guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "GameOverViewController") as? GameOverViewController else { return }
        guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }
        mainVC.modalPresentationStyle = .overCurrentContext
        self.present(mainVC, animated: false, completion: nil)
    }
}
