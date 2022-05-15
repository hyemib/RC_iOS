
import UIKit
import Alamofire

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView1: UICollectionView!
    
    var tvItems = [TVResult]()
    var movieItems = [MovieResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView1.delegate = self
        self.collectionView1.dataSource = self

        fetchMovie()
        fetchTV()
        
    }
}

extension HomeViewController {
    func fetchTV() {
        let request = AF.request("https://api.themoviedb.org/3/tv/popular?api_key=7e894335368b831907355f2d8aa30520&language=ko-KR&page=1")
        request.responseDecodable(of: TV.self) { (response) in
            guard let tvs = response.value else { return }
            self.tvItems = tvs.results
            print(self.tvItems[0].name)
        }
        
    }
    
    
    func fetchMovie() {
        let request = AF.request("https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=7e894335368b831907355f2d8aa30520&language=ko&page=1")
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
        return movieItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView1.frame.width / 3.5
        return CGSize(width: width, height: collectionView1.frame.height)
    }
}
