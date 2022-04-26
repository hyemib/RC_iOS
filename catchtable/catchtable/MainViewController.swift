
import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    var bannerImgs = ["mainImg1", "mainImg2", "mainImg3", "mainImg4", "mainImg5"]
    var bannerTitles1 = ["NEW", "PICK", "HOT", "NOW", "NEW"]
    var bannerTitlesColor = [UIColor(red: 0.051, green: 0.3608, blue: 0.3765, alpha: 1.0), UIColor.systemGray, UIColor(red: 0.6, green: 0.0824, blue: 0.0824, alpha: 1.0), UIColor(red: 0.0549, green: 0.0275, blue: 0.2078, alpha: 1.0), UIColor(red: 0.8392, green: 0.4157, blue: 0.1137, alpha: 1.0)]
    var bannerTitles2 = ["국내 최초로 공개되는 팝업 레스토랑", "어떤 날, 누구랑 함께해도 완벽할 거에요", "집 안 한 켠에 아껴둔 술, 지금이 기회에요!", "이대로 헤어지긴 아쉽잖아요.", "매년 이맘때쯤 찾게 되는"]
    var bannerTitles3 = ["피에르 상 at 루이 비통", "가정의 달 미식백서", "4월 콜키지 프리 레스토랑", "2차로 가기 좋은 곳", "테라스가 있는 곳"]
    var nowPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        pageControl.numberOfPages = bannerImgs.count
        pageControl.currentPage = 0
        
        bannerTimer()
    }
    
    func bannerTimer() {
        let _ : Timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    
    func bannerMove() {
        if nowPage == bannerImgs.count-1 {
            bannerCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowPage = 0
            return
        }
        nowPage += 1
        bannerCollectionView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerImgs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannerCell else {
            return UICollectionViewCell()
        }
        let img = UIImage(named: bannerImgs[indexPath.item])
        let txt1 = bannerTitles1[indexPath.item]
        let txt2 = bannerTitles2[indexPath.item]
        let txt3 = bannerTitles3[indexPath.item]
        cell.imgView.image = img
        cell.bannerTitle1.text = txt1
        cell.bannerTitle1.backgroundColor = bannerTitlesColor[indexPath.item]
        cell.bannerTitle2.text = txt2
        cell.bannerTitle3.text = txt3
        
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}

extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.bounds.size.width
        let x = scrollView.contentOffset.x + (width/2.0)
        
        let newPage = Int(x/width)
        if pageControl.currentPage != newPage {
            pageControl.currentPage = newPage
        }
    }
}
