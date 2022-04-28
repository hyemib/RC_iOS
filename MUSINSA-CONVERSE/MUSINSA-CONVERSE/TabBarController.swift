
import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
        
    }
    func setTabBar() {
        tabBar.barTintColor = .black
        tabBar.isTranslucent = false
        
        tabBar.tintColor = .white
        
    }
}


