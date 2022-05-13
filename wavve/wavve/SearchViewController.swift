
import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSearchBar()
    }
    
    func setSearchBar() {
        searchBar.placeholder = "검색어를 입력해주세요."
        searchBar.setImage(UIImage(named: "search"), for: UISearchBar.Icon.search, state: .normal)
        //let cancel = UIBarButtonItem(title: "취소", style: .plain, target: self, action: nil)
        //self.navigationItem.rightBarButtonItem = cancel

    }
}
