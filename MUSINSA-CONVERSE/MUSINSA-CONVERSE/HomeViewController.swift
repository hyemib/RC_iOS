

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        
        let nib = UINib(nibName: "BannerCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "BannerCell")
        
        setNavigationBar()
    }
    
    func setNavigationBar() {
        
        let logo = UIImageView(image: UIImage(named: "logo"))
        logo.contentMode = .scaleAspectFit
        logo.widthAnchor.constraint(equalToConstant: 100).isActive = true
        logo.tintColor = .white
        navigationItem.titleView = logo
        
        navigationController?.navigationBar.isTranslucent = true
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath)
        return cell
    }
}
