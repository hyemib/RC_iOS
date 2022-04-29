
import UIKit
import Tabman
import Pageboy

class CartViewController: TabmanViewController {

    private var viewControllers: Array<UIViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar()
        settingTabBar()
    }
    
    func navigationBar() {
        let backButtonItem = UIBarButtonItem()
        backButtonItem.tintColor = .black
        backButtonItem.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButtonItem
    }
    
    func settingTabBar () {
        let firstVC = storyboard?.instantiateViewController(withIdentifier: "FirstTabBarController") as! FirstTabBarController
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondTabBarController") as! SecondTabBarController
        
        viewControllers.append(firstVC)
        viewControllers.append(secondVC)
        
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        
        bar.backgroundView.style = .blur(style: .light)
        bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 20.0)
        bar.layout.contentMode = .fit
        //bar.layout.interButtonSpacing = 135
        
        bar.buttons.customize { (button) in
            button.tintColor = .systemGray4
            button.selectedTintColor = .black
            button.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            button.selectedFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
            
        }
        
        bar.indicator.weight = .custom(value: 2)
        bar.layout.alignment = .centerDistributed
        bar.indicator.tintColor = .black
        addBar(bar, dataSource: self, at: .top)
    }
}

extension CartViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0 :
            return TMBarItem(title: "택배배송")
        default :
            return TMBarItem(title: "무탠픽업")
        }
    }
  
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
        
    }
    
    
}
