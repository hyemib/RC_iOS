
import UIKit
import Tabman
import Pageboy

class HomeTabbarViewController: TabmanViewController {
    
    private var viewControllers: Array<UIViewController> = []
    
    var data = Data.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTabBar()

    }
    
    func settingTabBar() {
        let productVC = storyboard?.instantiateViewController(withIdentifier: "HomeTabbarProductViewController") as! HomeTabbarProductViewController
        let styleVC = storyboard?.instantiateViewController(withIdentifier: "HomeTabbarStyleViewController")
        let magazineVC = storyboard?.instantiateViewController(withIdentifier: "HomeTabbarMagazineViewController")
        let lookbookVC = storyboard?.instantiateViewController(withIdentifier: "HomeTabbarLookbookViewController")
        let contentVC = storyboard?.instantiateViewController(withIdentifier: "HomeTabbarContentViewController")
        
        viewControllers.append(productVC)
        viewControllers.append(styleVC!)
        viewControllers.append(magazineVC!)
        viewControllers.append(lookbookVC!)
        viewControllers.append(contentVC!)
        
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        
        bar.backgroundView.style = .blur(style: .light)
        bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 15.0, bottom: 0.0, right: 0.0)
        
        bar.layout.transitionStyle = .snap
        bar.layout.interButtonSpacing = 22
        
        bar.buttons.customize { (button) in
            button.tintColor = .systemGray2
            button.selectedTintColor = .black
            button.font = UIFont.systemFont(ofSize: 17, weight: .regular)
            button.selectedFont = UIFont.systemFont(ofSize: 17, weight: .semibold)
            
        }
        
        bar.indicator.weight = .custom(value: 2)
        //bar.layout.alignment = .centerDistributed
       //bar.layout.contentMode = .fit
        bar.indicator.tintColor = .black
        
        addBar(bar, dataSource: self, at: .top)
        
    }
}

extension HomeTabbarViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0 :
            return TMBarItem(title: "상품")
        case 1 :
            return TMBarItem(title: "스타일")
        case 2 :
            return TMBarItem(title: "매거진")
        case 3 :
            return TMBarItem(title: "룩북")
        default:
            return TMBarItem(title: "콘텐츠")
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
