
import UIKit

class BannerCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var bannerImgs = ["bannerImg1", "bannerImg2", "bannerImg3", "bannerImg4", "bannerImg5", "bannerImg6"]
    var bannerTitles = ["페인트 스플래터", "에너지 바이브", "아카이브 프린트", "블랙핀스트라이프", "리뉴", "척 70뮬"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        
        collectionView.register(UINib(nibName: "BannerCell2", bundle: nil), forCellWithReuseIdentifier: "BannerCell2")

        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerImgs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell2", for: indexPath) as! BannerCell2
        let img = UIImage(named: bannerImgs[indexPath.item])
        let txt = bannerTitles[indexPath.item]
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


