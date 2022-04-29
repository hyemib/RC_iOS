
import UIKit

protocol CollectionViewDelegate: AnyObject {
    func collectionView(collectionviewcell: ProductCell2?, index: Int, didTrappedInTableViewCell: ProductCell)
}


class ProductCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!

    weak var cellDelegate: CollectionViewDelegate?
    
    var data = Data.shared
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setCall()
        
        
        
    }
    
    func setCall() {
        collectionView.register(UINib(nibName: "ProductCell2", bundle: nil), forCellWithReuseIdentifier: "ProductCell2")
        
        collectionView.delegate = self
        collectionView.dataSource = self
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? ProductCell2
        self.cellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTrappedInTableViewCell: self)
    }
}



