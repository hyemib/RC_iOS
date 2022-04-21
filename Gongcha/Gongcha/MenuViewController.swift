
import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var menuButton1: UIButton!
    @IBOutlet weak var menuButton2: UIButton!
    @IBOutlet weak var menuButton3: UIButton!
    @IBOutlet weak var menuButton4: UIButton!
    @IBOutlet weak var menuButton5: UIButton!
    
    @IBOutlet weak var drinkImage1: UIImageView!
    @IBOutlet weak var drinkImage2: UIImageView!
    @IBOutlet weak var drinkImage3: UIImageView!
    @IBOutlet weak var drinkImage4: UIImageView!
    @IBOutlet weak var drinkImage5: UIImageView!
    
    @IBOutlet weak var drinkTitle1: UILabel!
    @IBOutlet weak var drinkTitle2: UILabel!
    @IBOutlet weak var drinkTitle3: UILabel!
    @IBOutlet weak var drinkTitle4: UILabel!
    @IBOutlet weak var drinkTitle5: UILabel!
    
    @IBOutlet weak var drinkPrice1: UILabel!
    @IBOutlet weak var drinkPrice2: UILabel!
    @IBOutlet weak var drinkPrice3: UILabel!
    @IBOutlet weak var drinkPrice4: UILabel!
    @IBOutlet weak var drinkPrice5: UILabel!
    
    let drink = Drink.shared
    var pressButton = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        pressMenuButton(1)
    }
    
    func setNavigationBar() {
        let backButtonItem = UIBarButtonItem()
        backButtonItem.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButtonItem
    }
    
    func pressMenuButton(_ buttonNum: Int) {
        let menuButtonArray = [menuButton1, menuButton2, menuButton3, menuButton4, menuButton5]
        let drinkTitleArray = [drinkTitle1, drinkTitle2, drinkTitle3, drinkTitle4, drinkTitle5]
        let drinkPriceArray = [drinkPrice1, drinkPrice2, drinkPrice3, drinkPrice4, drinkPrice5]
        let drinkImageArray = [drinkImage1, drinkImage2, drinkImage3, drinkImage4, drinkImage5]
        menuButtonArray[pressButton]?.tintColor = .systemGray
        menuButtonArray[buttonNum-1]?.tintColor = UIColor(red: 0.6863, green: 0, blue: 0.1137, alpha: 1.0)
        
        pressButton = buttonNum-1
        
        for i in 0..<drinkTitleArray.count {
            drinkTitleArray[i]?.text = drink.drinkTitle[buttonNum-1][i]
            drinkPriceArray[i]?.text = drink.drinkPrice[buttonNum-1][i]
            drinkImageArray[i]?.image = UIImage(named: drink.drinkImage[buttonNum-1][i])
        }
    }
    
    @IBAction func pressMenuButton1(_ sender: UIButton) {
        pressMenuButton(1)
    }
    
    @IBAction func pressMenuButton2(_ sender: UIButton) {
        pressMenuButton(2)
    }
    
    @IBAction func pressMenuButton3(_ sender: UIButton) {
        pressMenuButton(3)
    }
    
    @IBAction func pressMenuButton4(_ sender: UIButton) {
        pressMenuButton(4)
    }
    
    @IBAction func pressMenuButton5(_ sender: UIButton) {
        pressMenuButton(5)
    }
    
}
