
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = Data.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = UIColor(white: 245/255, alpha: 1)
        
        let nib1 = UINib(nibName: "BannerCell", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "BannerCell")
        let nib2 = UINib(nibName: "MenuCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "MenuCell")
        let nib3 = UINib(nibName: "CategoryCell", bundle: nil)
        tableView.register(nib3, forCellReuseIdentifier: "CategoryCell")
        let nib4 = UINib(nibName: "RankingCell", bundle: nil)
        tableView.register(nib4, forCellReuseIdentifier: "RankingCell")
        let nib5 = UINib(nibName: "ProductCell", bundle: nil)
        tableView.register(nib5, forCellReuseIdentifier: "ProductCell")
        
        setNavigationBar()
        
    }
    
    func setNavigationBar() {
        
        let logo = UIImageView(image: UIImage(named: "logo"))
        logo.contentMode = .scaleAspectFit
        logo.widthAnchor.constraint(equalToConstant: 100).isActive = true
        logo.tintColor = .white
        navigationItem.titleView = logo
        
        navigationController?.navigationBar.isTranslucent = true
        
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.HomeData.count+1
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
            return cell
        } else if indexPath.row == 4 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductCell {
                cell.cellDelegate = self
                return cell
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "RankingCell", for: indexPath)
        return cell
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2  {
            return 170
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 3
    }
    
}

extension HomeViewController: CollectionViewDelegate {
    func collectionView(collectionviewcell: ProductCell2?, index: Int, didTrappedInTableViewCell: ProductCell) {
        guard let productVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as? ProductViewController else { return }
        productVC.title1 = data.HomeData[3][index].title ?? ""
        productVC.image = UIImage(named: data.HomeData[3][index].imageName)
        productVC.price = data.HomeData[3][index].price ?? ""
        productVC.star = "\(data.HomeData[3][index].star ?? "0")개"
        self.navigationController?.pushViewController(productVC, animated: true)
    }
}


