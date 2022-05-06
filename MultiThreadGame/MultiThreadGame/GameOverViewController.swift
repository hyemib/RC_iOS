
import UIKit

class GameOverViewController: UIViewController {

    @IBOutlet weak var gameOverView: UIView!
    @IBOutlet weak var totalScore: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var score: Int = 0
    var scores = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        gameOverView.layer.borderWidth = 2.7
        gameOverView.layer.cornerRadius = 50
        
        totalScore.text = String(score)
        
        scores = UserDefaults.standard.object(forKey: "data1") as! [Int]
        scores.sort(by: >)
        tableView.delegate = self
        tableView.dataSource = self

    }
}

extension GameOverViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreCell", for: indexPath) as! ScoreCell
       
        cell.scoreLabel.text = String(scores[indexPath.row])
        return cell
    }
    
    
}
