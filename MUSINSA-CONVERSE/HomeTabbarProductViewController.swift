
import UIKit

class HomeTabbarProductViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var rankingCollectionView: UICollectionView!
    
    var data = Data.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rankingCollectionView.delegate = self
        rankingCollectionView.dataSource = self
        
        rankingCollectionView.register(UINib(nibName: "RankingCell", bundle: nil), forCellWithReuseIdentifier: "RankingCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.HomeData[2].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RankingCell", for: indexPath) as! RankingCell
        let img = UIImage(named: data.HomeData[2][indexPath.item].imageName)
        let txt2 = data.HomeData[2][indexPath.item].price
        cell.image.contentMode = .scaleAspectFill
        cell.image.image = img
        cell.price.text = txt2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (rankingCollectionView.frame.width - 5) / 3, height: rankingCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
        
    }
}
