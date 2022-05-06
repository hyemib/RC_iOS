
import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var heart: UIImageView!
    @IBOutlet weak var ryan: UIImageView!
    @IBOutlet weak var totalScore: UILabel!
    
    var timer: Timer?
    var positionX: CGFloat!
    var ryanY: CGFloat! = 700
    var ryanPosition: CGFloat! = 215
    var tubes = [UIImageView]()
    var snows = [UIImageView]()
    var heartCount = 3
    var tubeIndex = 0
    var score = 0
    var scores = [Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        heart.image = UIImage(named: "heart3")
        
        self.ryan.frame = CGRect(x: ryan.center.x, y: ryanY, width: 90, height: 110)
        
        scores = UserDefaults.standard.object(forKey: "data1") as? [Int] ?? []
        
        
        DispatchQueue.global().async {
            let isRunning = true
            let runLoop = RunLoop.current
            self.timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
                DispatchQueue.main.sync {
                    self.createTube()
                }
            }
            while isRunning {
                runLoop.run(until: Date().addingTimeInterval(0.1))
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        createTube()
    }
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!.location(in: self.view)
        self.ryan.contentMode = .scaleAspectFit
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3) {
                self.ryan.frame = CGRect(x: touch.x, y: self.ryanY, width: 90, height: 110)
                self.ryanPosition = touch.x

            }
        }
        if touch.y <= 700 {
            let snow = UIImageView(image: UIImage(named: "snow"))
            snow.contentMode = .scaleAspectFit
            snow.frame = CGRect(x: touch.x, y: ryanY, width: 40, height: 40)
            snows.append(snow)
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.3, animations: {
                    snow.frame = CGRect(x: touch.x, y: touch.y, width: 40, height: 40)
                })
            }
            self.view.addSubview(snow)
            for i in 0..<tubes.count {
               // print(tubes[i].frame.minX, tubes[i].frame.maxX)
                if tubes[i].frame.minX <= touch.x && tubes[i].frame.maxX >= touch.x && tubes[i].frame.minY <= touch.y && tubes[i].frame.maxY >= touch.y {
                    switch tubes[i].image {
                    case UIImage(named: "tube1-1"):
                        tubes[i].image = UIImage(named: "tube2-1")
                    case UIImage(named: "tube2-1"):
                        tubes[i].image = UIImage(named: "tube3-1")
                    default:
                        tubes[i].image = UIImage(named: "tube4")
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                            self.tubes[i].removeFromSuperview()
                            self.score += 200
                            self.totalScore.text = String(self.score)
                        }
                    }
                }
            }
        }
    }

    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) { [self] in
            for snow in snows {
                snow.removeFromSuperview()
            }
        }
    }
    
    func createTube() {
        let tube = UIImageView(image: UIImage(named: "tube1-1"))
        tube.contentMode = .scaleAspectFit
        let x = self.view.frame.width-100
        let y = self.view.frame.height/2+30
        let rangeX =  CGFloat(Int.random(in: 10...Int(x)))
        let rangeY = y/2+CGFloat(Int.random(in: 0...50))
        let tubeWidth = 60
        let tubeHeiht = 80
        tube.frame = CGRect(x: rangeX, y: 210, width: 60, height: 80)
        tubes.append(tube)
        tubeIndex += 1
        
        moveTube(tube: tube, rangeX: rangeX, rangeY: rangeY, moveY: 0, width: CGFloat(tubeWidth+8), heiht: CGFloat(tubeHeiht+8))
        
        self.view.addSubview(tube)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 7) {
            self.moveTube(tube: tube, rangeX: rangeX, rangeY: rangeY, moveY: 90, width: CGFloat(tubeWidth+15), heiht: CGFloat(tubeHeiht+15))
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 7) {
                self.moveTube(tube: tube, rangeX: rangeX, rangeY: rangeY, moveY: 220, width: CGFloat(tubeWidth+25), heiht: CGFloat(tubeHeiht+25))
            }
        }
        
    }
    
    func moveTube(tube: UIImageView, rangeX: CGFloat, rangeY: CGFloat, moveY: CGFloat, width: CGFloat, heiht: CGFloat) {
        let tubePosition = CGFloat(Int.random(in: Int(rangeX-60)...Int(rangeX+60)))
        
        UIView.animate(withDuration: 3, animations: {
            tube.frame = CGRect(x: tubePosition, y: rangeY+moveY, width: width, height: heiht)
        }) { _ in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                switch tube.image {
                case UIImage(named: "tube1-1"):
                    tube.image = UIImage(named: "tube1-2")
                case UIImage(named: "tube2-1"):
                    tube.image = UIImage(named: "tube2-2")
                default:
                    tube.image = UIImage(named: "tube3-2")
                }
                let snow = UIImageView(image: UIImage(named: "snow"))
                snow.contentMode = .scaleAspectFit
                snow.frame = CGRect(x: tubePosition, y: rangeY+moveY+50, width: 40, height: 40)
                DispatchQueue.main.async {
                    UIView.animate(withDuration: 0.6, animations: {
                        snow.frame = CGRect(x: tubePosition, y: self.view.frame.height, width: 40, height: 40)
                    })
                    self.view.addSubview(snow)
                }
                
                if self.ryan.frame.minX <= tubePosition && self.ryan.frame.maxX >= tubePosition {
                    self.ryan.image = UIImage(named: "ryan1-2")
                    self.changeHeart()
                }
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.7) {
                    switch tube.image {
                    case UIImage(named: "tube1-2"):
                        tube.image = UIImage(named: "tube1-1")
                    case UIImage(named: "tube2-2"):
                        tube.image = UIImage(named: "tube2-1")
                    default:
                        tube.image = UIImage(named: "tube3-1")
                    }
                    snow.removeFromSuperview()
                    self.ryan.image = UIImage(named: "ryan1-1")
                }
            }
        }
    }
    
    func changeHeart() {
        switch heartCount {
        case 3 :
            heart.image = UIImage(named: "heart2")
            heartCount -= 1
            
            
            scores.append(self.score)
            UserDefaults.standard.set(scores, forKey: "data1")
            self.timer?.invalidate()
            gameOver()
        case 2 :
            heart.image = UIImage(named: "heart1")
            heartCount -= 1
        default:
            heart.image = UIImage(named: "heart0")
            
        }
    }
    
    func gameOver() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            guard let pauseVC = self.storyboard?.instantiateViewController(withIdentifier: "GameOverViewController") as? GameOverViewController else { return }
            pauseVC.modalPresentationStyle = .overCurrentContext
            pauseVC.score = self.score
            self.present(pauseVC, animated: false, completion: nil)
        }
    }
}
