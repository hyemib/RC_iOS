
import UIKit

var likeList = LikeList()

class LikeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, HeartDelegate  {
    
    var data = Data.shared
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
        print(likeList.Count)
    }
    
    func pressedHeartBtn(for index: Int, like: Bool) {
        if like == false {
            
        } else {
            
        }
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return likeList.Count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.delegate = self
        cell.index = indexPath.item
        let cellData = likeList.itemAt(index: indexPath.row)
        cell.title.text = cellData.title
        cell.image.image = UIImage(named: cellData.imageName ?? "")
        cell.price.text = cellData.price
        cell.heartTitle.text = cellData.heartCount
        cell.starStackView.isHidden = true
        cell.heartBtn.isHidden = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: 350 )
    }

}
