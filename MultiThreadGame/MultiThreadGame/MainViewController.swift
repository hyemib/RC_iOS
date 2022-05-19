
import UIKit
import AVFoundation

var soundEffect: AVAudioPlayer?

class MainViewController: UIViewController {

    @IBOutlet weak var heart: UIImageView!
    @IBOutlet weak var ryan: UIImageView!
    @IBOutlet weak var totalScore: UILabel!
    
    var timer: Timer?
    var ryanY: CGFloat! = 700
    var ryanPosition: CGFloat! = 215
    var tubes = [UIImageView:Int]()
    var snows = [UIImageView]()
    var heartCount = 3
    var score = 0
    var scores = [Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playAudio()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        createTube()
        heart.image = UIImage(named: "heart3")
        self.ryan.frame = CGRect(x: ryan.center.x, y: ryanY, width: 90, height: 110)
        scores = UserDefaults.standard.object(forKey: "data1") as? [Int] ?? []
        
        DispatchQueue.global().async {
            let isRunning = true
            let runLoop = RunLoop.current
            self.timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
                DispatchQueue.main.sync {
                    self.createTube()

                }
            }
            while isRunning {
                runLoop.run(until: Date().addingTimeInterval(0.1))
            }
        }
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
        }
    }

    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) { [self] in
            for snow in snows {
                snow.removeFromSuperview()
            }
        }
        let touch = touches.first!.location(in: self.view)
        for (key,value) in tubes {
           // print(tubes[i].frame.minX, tubes[i].frame.maxX, touch.x)
           // print(tubes[i].frame.minY, tubes[i].frame.maxY, touch.y)
            if key.frame.minX <= touch.x && key.frame.maxX >= touch.x && key.frame.minY <= touch.y && key.frame.maxY >= touch.y {
                print("")
                switch value {
                case 3:
                    key.image = UIImage(named: "tube2-1")
                    tubes[key]! -= 1
                case 2:
                    key.image = UIImage(named: "tube3-1")
                    tubes[key]! -= 1
                default:
                    key.image = UIImage(named: "tube4")
                    self.score += 200
                    self.totalScore.text = String(self.score)
                    self.tubes.removeValue(forKey: key)
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                        key.removeFromSuperview()
                        
                    }
                }
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
        tube.frame = CGRect(x: rangeX, y: 220, width: 60, height: 80)
        tubes.updateValue(3, forKey: tube)
        
        moveTube(tube: tube, rangeX: rangeX, rangeY: rangeY)

    }
    
    func moveTube(tube: UIImageView, rangeX: CGFloat, rangeY: CGFloat) {
        var tubeX: CGFloat!
        UIView.animate(withDuration: 5, animations: {
            var tubePositionX = CGFloat(Int.random(in: Int(rangeX-60)...Int(rangeX+60)))
            if tubePositionX <= 20 {
                tubePositionX = 20
            } else if tubePositionX >= self.view.frame.width-20 {
                tubePositionX = self.view.frame.width-20
            }
            tubeX = tubePositionX
            tube.frame = CGRect(x: tubePositionX, y: rangeY+50, width: 68, height: 88)
            DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
                if self.tubes.keys.contains(tube) {
                    DispatchQueue.main.async() {
                        self.makeSonow(tube: tube, rangeX: tube.frame.minX, rangeY: tube.frame.minY, tubePositionX: tubeX)
                    }
                }
            }
        })
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4.5) {
            UIView.animate(withDuration: 4.5, animations: {
                var tubePositionX = CGFloat(Int.random(in: Int(rangeX-60)...Int(rangeX+60)))
                if tubePositionX <= 20 {
                    tubePositionX = 20
                } else if tubePositionX >= self.view.frame.width-20 {
                    tubePositionX = self.view.frame.width-20
                }
                
                if self.tubes.keys.contains(tube) {
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                        self.makeSonow(tube: tube, rangeX: tube.frame.minX, rangeY: tube.frame.minY-100, tubePositionX: tubeX)
                    }
                }
                tube.frame = CGRect(x: tubePositionX, y: rangeY+200, width: 75, height: 96)
            })
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 8.8) {
            UIView.animate(withDuration: 4.2, animations: {
                var tubePositionX = CGFloat(Int.random(in: Int(rangeX-60)...Int(rangeX+60)))
                if tubePositionX <= 20 {
                    tubePositionX = 20
                } else if tubePositionX >= self.view.frame.width-20 {
                    tubePositionX = self.view.frame.width-20
                }
                
                if self.tubes.keys.contains(tube) {
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                        self.makeSonow(tube: tube, rangeX: tube.frame.minX, rangeY: tube.frame.minY-50, tubePositionX: tubeX)
                    }
                }
                
                tube.frame = CGRect(x: tubePositionX, y: rangeY+300, width: 83, height: 104)
            }) { _ in
                
            }
        }
        self.view.addSubview(tube)
    }
    
    func makeSonow(tube: UIImageView, rangeX: CGFloat, rangeY: CGFloat, tubePositionX: CGFloat) {
            DispatchQueue.main.async {
                let snow = UIImageView(image: UIImage(named: "snow"))
                snow.contentMode = .scaleAspectFit
                snow.frame = CGRect(x: tubePositionX, y: rangeY+50, width: 40, height: 40)
                DispatchQueue.main.async {
                    UIView.animate(withDuration: 1.5, animations: {
                        snow.frame = CGRect(x: tubePositionX, y: self.view.frame.height, width: 40, height: 40)
                    }) { _ in
                        if self.ryan.frame.minX <= tubePositionX+20 && self.ryan.frame.maxX >= tubePositionX {
                            self.ryan.image = UIImage(named: "ryan1-2")
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.4) {
                                self.ryan.image = UIImage(named: "ryan1-1")
                            }
                            self.changeHeart()
                        }
                    }
                    self.view.addSubview(snow)
                }
                switch tube.image {
                case UIImage(named: "tube1-1"):
                    tube.image = UIImage(named: "tube1-2")
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.4) {
                        tube.image = UIImage(named: "tube1-1")
                    }
                case UIImage(named: "tube2-1"):
                    tube.image = UIImage(named: "tube2-2")
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.4) {
                        tube.image = UIImage(named: "tube2-1")
                    }
                default:
                    tube.image = UIImage(named: "tube3-2")
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.4) {
                        tube.image = UIImage(named: "tube3-1")
                    }
                }
        }
    }
    
    
    func changeHeart() {
        switch heartCount {
        case 3 :
            heart.image = UIImage(named: "heart2")
            heartCount -= 1
        case 2 :
            heart.image = UIImage(named: "heart1")
            heartCount -= 1
        default:
            heart.image = UIImage(named: "heart0")
            
            gameOver()
            
        }
    }
    
    func gameOver() {
        self.timer?.invalidate()
        scores.append(self.score)
        UserDefaults.standard.set(scores, forKey: "data1")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            soundEffect?.stop()
            guard let pauseVC = self.storyboard?.instantiateViewController(withIdentifier: "GameOverViewController") as? GameOverViewController else { return }
            pauseVC.modalPresentationStyle = .overCurrentContext
            pauseVC.score = self.score
            self.present(pauseVC, animated: false, completion: nil)
        }
    }
    
    func playAudio() {
        let url = Bundle.main.url(forResource: "bgm", withExtension: "mp3")
        if let url = url{
            do {
                soundEffect = try AVAudioPlayer(contentsOf: url)
                guard let sound = soundEffect else { return }
                sound.play()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
