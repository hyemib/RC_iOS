
import UIKit
import Tabman
import Pageboy

class HomeViewController: TabmanViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var viewControllers: Array<UIViewController> = []
    
    var data = Data.shared
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var rankingCollectionView: UICollectionView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    @IBOutlet weak var menuView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        rankingCollectionView.delegate = self
        rankingCollectionView.dataSource = self
        
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        
        bannerCollectionView.register(UINib(nibName: "BannerCell", bundle: nil), forCellWithReuseIdentifier: "BannerCell")
        rankingCollectionView.register(UINib(nibName: "RankingCell", bundle: nil), forCellWithReuseIdentifier: "RankingCell")
        productCollectionView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
        
        bannerCollectionView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        
        
        setNavigationBar()
        settingTabBar()
    }
    
    func setNavigationBar() {
        
        let logo = UIImageView(image: UIImage(named: "logo"))
        logo.contentMode = .scaleAspectFit
        logo.widthAnchor.constraint(equalToConstant: 100).isActive = true
        logo.tintColor = .white
        navigationItem.titleView = logo
        
        let rightButton = UIBarButtonItem(image: UIImage(named: "bag2"), style: .plain, target: self, action: #selector(moveCart))
        self.navigationItem.rightBarButtonItem = rightButton
        
        //navigationController?.navigationBar.isTranslucent = true
        
    }
    
    @objc func moveCart() {
        guard let CartVC = storyboard?.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController else { return }
        CartVC.modalPresentationStyle = .overCurrentContext
        self.navigationController?.pushViewController(CartVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bannerCollectionView {
            return data.HomeData[0].count
        } else if collectionView == rankingCollectionView {
            return data.HomeData[2].count
        }
        return data.HomeData[3].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == bannerCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
            let img = UIImage(named: data.HomeData[0][indexPath.item].imageName)
            let txt = data.HomeData[0][indexPath.item].title
            cell.image.contentMode = .scaleAspectFill
            cell.image.image = img
            cell.title.text = txt
            return cell
        } else if collectionView == rankingCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RankingCell", for: indexPath) as! RankingCell
            let img = UIImage(named: data.HomeData[2][indexPath.item].imageName)
            let txt2 = data.HomeData[2][indexPath.item].price
            cell.rankTitle.text = "\(indexPath.item+1)위"
            cell.image.contentMode = .scaleAspectFill
            cell.image.image = img
            cell.price.text = txt2
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        let img = UIImage(named: data.HomeData[3][indexPath.item].imageName)
        let title = data.HomeData[3][indexPath.item].title
        let price = data.HomeData[3][indexPath.item].price
        let star = data.HomeData[3][indexPath.item].star
        let heart = data.HomeData[3][indexPath.item].heart
        cell.image.contentMode = .scaleAspectFill
        cell.image.image = img
        cell.title.text = title
        cell.price.text = price
        cell.starTitle.text = star
        cell.heartTitle.text = heart
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == bannerCollectionView {
            return CGSize(width: (bannerCollectionView.frame.width + 20)/3, height: bannerCollectionView.frame.height)
        } else if collectionView == rankingCollectionView {
            return CGSize(width: (rankingCollectionView.frame.width) / 2.7, height: rankingCollectionView.frame.height)
        }
        return CGSize(width: productCollectionView.frame.width / 2, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == productCollectionView {
            return 0
        }
        return 5
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
        
        addBar(bar, dataSource: self, at: .custom(view: menuView, layout: nil))
        
    }
}


extension HomeViewController: PageboyViewControllerDataSource, TMBarDataSource {
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


