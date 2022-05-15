
import UIKit
import Alamofire

class HomeViewController: UIViewController {

    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var bannerTitle: UILabel!
    @IBOutlet weak var bannerSubTitle: UILabel!
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    
    var bannerImages = ["banner1", "banner2", "banner3", "banner4"]
    var bannerTitles = ["황금 나침반", "내일", "지금부터, 쇼타임!", "어게인 마이 라이프"]
    var bannerSubTitles = ["진실을 알려주는 기계", "'죽고 싶은 사람들' 우리가 실릴게", "당신의 마음을 어루 만져주기를!" ,"열혈 검사의 절대 악 응징기"]
    var tvItems = [TVResult]()
    var movieItems = [MovieResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView1.delegate = self
        self.collectionView1.dataSource = self
        self.collectionView2.delegate = self
        self.collectionView2.dataSource = self

        logoView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        pageControl.numberOfPages = bannerTitles.count
        pageControl.currentPage = 0
        bannerTitle.text = bannerTitles[0]
        bannerSubTitle.text = bannerSubTitles[0]
        bannerImage.image = UIImage(named: bannerImages[0])
        
        fetchMovie()
        fetchTV()
    }
    
    @IBAction func chageBanner(_ sender: UIPageControl) {
        bannerImage.image = UIImage(named: bannerImages[pageControl.currentPage])
        bannerTitle.text = bannerTitles[pageControl.currentPage]
        bannerSubTitle.text = bannerSubTitles[pageControl.currentPage]
    }
    
}

extension HomeViewController {
    func fetchTV() {
        let request = AF.request("https://api.themoviedb.org/3/tv/popular?api_key=7e894335368b831907355f2d8aa30520&language=ko-KR&page=1")
        request.responseDecodable(of: TV.self) { (response) in
            guard let tvs = response.value else { return }
            self.tvItems = tvs.results
            self.collectionView2.reloadData()
            print(self.tvItems[0].name)
        }
        
    }
    
    
    func fetchMovie() {
        let request = AF.request("https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=7e894335368b831907355f2d8aa30520&language=ko-KR&page=1")
        request.responseDecodable(of: Movie.self) { (response) in
            guard let movies = response.value else { return }
            self.movieItems = movies.results
            self.collectionView1.reloadData()
            print(self.movieItems[0].title)
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView1 {
            return movieItems.count
        }
        return tvItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionView1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell1", for: indexPath) as! CollectionViewCell1
            cell.title.text = movieItems[indexPath.row].title
            let url = URL(string: "https://image.tmdb.org/t/p/w500/"+movieItems[indexPath.row].poster)
            if let data = try? Data(contentsOf: url!) {
                if let image = UIImage(data: data) {
                    cell.image.image = image
                }
            }
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell2", for: indexPath) as! CollectionViewCell2
        cell.title.text = tvItems[indexPath.row].name
        let url = URL(string: "https://image.tmdb.org/t/p/w500/"+tvItems[indexPath.row].poster)
        if let data = try? Data(contentsOf: url!) {
            if let image = UIImage(data: data) {
                cell.image.image = image
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView1.frame.width / 3.5, height: collectionView1.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let detailVC = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else { return }
        detailVC.modalPresentationStyle = .fullScreen
        if collectionView == collectionView1 {
            detailVC.dataName = movieItems[indexPath.row].title
            detailVC.dataImage = movieItems[indexPath.row].poster
            detailVC.dataOverview = movieItems[indexPath.row].overview
            detailVC.dataDate = movieItems[indexPath.row].date
        } else {
            detailVC.dataName = tvItems[indexPath.row].name
            detailVC.dataImage = tvItems[indexPath.row].poster
            detailVC.dataOverview = tvItems[indexPath.row].overview
            detailVC.dataDate = tvItems[indexPath.row].date
        }
        self.present(detailVC, animated: false) 
    }
}
