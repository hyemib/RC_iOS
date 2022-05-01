
import UIKit

class OptionListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var sizeArr = [String]()
    var name: String?
    var count: String?
    
    weak var delegate: SendDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.layer.borderWidth = 1
        
        let nib1 = UINib(nibName: "OptionTableViewCell1", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "OptionTableViewCell1")
        let nib2 = UINib(nibName: "OptionTableViewCell2", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "OptionTableViewCell2")

        for i in stride(from: 220, through: 300, by: 5) {
            sizeArr.append(String(i))
        }
    }
    
    
    

}

extension OptionListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sizeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OptionTableViewCell1", for: indexPath) as! OptionTableViewCell1
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionTableViewCell2", for: indexPath) as! OptionTableViewCell2
        cell.title.text = sizeArr[indexPath.row-1]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.dismiss(animated: false, completion: nil)
    
        }
        self.delegate?.send(name: "\(sizeArr[indexPath.row-1])")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
