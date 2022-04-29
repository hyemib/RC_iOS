
import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
        
        self.selectedIndex = 2
    }
    func setTabBar() {
        tabBar.barTintColor = .black
        tabBar.isTranslucent = false
        
        tabBar.tintColor = .white
        
    }
}


