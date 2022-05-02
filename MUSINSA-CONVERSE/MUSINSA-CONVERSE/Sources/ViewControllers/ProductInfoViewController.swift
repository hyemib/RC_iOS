
import UIKit
import Tabman
import Pageboy


class ProductInfoViewController: TabmanViewController  {
    
    private var viewControllers: Array<UIViewController> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        settingTabBar()
    }
    

    func settingTabBar () {
        let infoVC = storyboard?.instantiateViewController(withIdentifier: "ProductTabbarInfoViewController")
        let sizeVC = storyboard?.instantiateViewController(withIdentifier: "ProductTabbarSizeViewController")
        let postVC = storyboard?.instantiateViewController(withIdentifier: "ProductTabbarPostViewController")
        let inquiryVC = storyboard?.instantiateViewController(withIdentifier: "ProductTabbarInquiryViewController")
        
        viewControllers.append(infoVC!)
        viewControllers.append(sizeVC!)
        viewControllers.append(postVC!)
        viewControllers.append(inquiryVC!)
        
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        
        bar.backgroundView.style = .blur(style: .light)
        bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
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

extension ProductInfoViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0 :
            return TMBarItem(title: "정보")
        case 1 :
            return TMBarItem(title: "사이즈")
        case 2 :
            return TMBarItem(title: "후기")
        default :
            return TMBarItem(title: "문의")
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
