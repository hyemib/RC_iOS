
import UIKit

class BannerCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var data = Data.shared
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        
        collectionView.register(UINib(nibName: "BannerCell2", bundle: nil), forCellWithReuseIdentifier: "BannerCell2")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.HomeData[0].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell2", for: indexPath) as! BannerCell2
        let img = UIImage(named: data.HomeData[0][indexPath.item].imageName)
        let txt = data.HomeData[0][indexPath.item].title
        cell.image.contentMode = .scaleAspectFill
        cell.image.image = img
        cell.title.text = txt
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 145, height: 135)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
        
    }
}


