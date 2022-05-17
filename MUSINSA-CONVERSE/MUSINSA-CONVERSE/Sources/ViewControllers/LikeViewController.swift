
import UIKit

class LikeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var data = Data.shared
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
      
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.HomeData[4].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        let img = UIImage(named: data.HomeData[4][indexPath.item].imageName)
        let title = data.HomeData[4][indexPath.item].title
        let price = data.HomeData[4][indexPath.item].price
        let star = data.HomeData[4][indexPath.item].starCount
        let heart = data.HomeData[4][indexPath.item].heartCount
        cell.image.contentMode = .scaleAspectFill
        cell.image.image = img
        cell.title.text = title
        cell.price.text = price
        cell.starTitle.text = star
        cell.heartTitle.text = heart
        cell.index = indexPath.item
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: 350 )
    }

}
