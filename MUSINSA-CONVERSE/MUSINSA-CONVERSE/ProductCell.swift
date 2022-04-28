
import UIKit

class ProductCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!

    var data = Data.shared
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "ProductCell2", bundle: nil), forCellWithReuseIdentifier: "ProductCell2")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.HomeData[3].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell2", for: indexPath) as! ProductCell2
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
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height+50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
        
    }
    
}
