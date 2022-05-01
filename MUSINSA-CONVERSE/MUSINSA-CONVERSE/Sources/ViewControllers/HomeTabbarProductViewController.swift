
import UIKit

class HomeTabbarProductViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var rankingCollectionView: UICollectionView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    var data = Data.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // rankingCollectionView.delegate = self
       // rankingCollectionView.dataSource = self
        
       // productCollectionView.delegate = self
       // productCollectionView.dataSource = self
        
       // rankingCollectionView.register(UINib(nibName: "RankingCell", bundle: nil), forCellWithReuseIdentifier: "RankingCell")
        //productCollectionView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == rankingCollectionView {
            return data.HomeData[2].count
        }
        return data.HomeData[3].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == rankingCollectionView {
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
        if collectionView == rankingCollectionView {
            return CGSize(width: (rankingCollectionView.frame.width) / 2.7, height: rankingCollectionView.frame.height)
        }
        return CGSize(width: productCollectionView.frame.width / 2, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}
