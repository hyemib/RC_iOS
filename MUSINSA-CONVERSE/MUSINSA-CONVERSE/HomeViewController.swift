
import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var data = Data.shared
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        bannerCollectionView.register(UINib(nibName: "BannerCell", bundle: nil), forCellWithReuseIdentifier: "BannerCell")
        
        bannerCollectionView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        
        setNavigationBar()
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
        return data.HomeData[0].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        let img = UIImage(named: data.HomeData[0][indexPath.item].imageName)
        let txt = data.HomeData[0][indexPath.item].title
        cell.image.contentMode = .scaleAspectFill
        cell.image.image = img
        cell.title.text = txt
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (bannerCollectionView.frame.width + 20)/3, height: bannerCollectionView.frame.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}





