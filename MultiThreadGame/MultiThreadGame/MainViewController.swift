
import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var ryan: UIImageView!
    var positionX: CGFloat!
    var ryanY: CGFloat! = 700
    var tubes = [UIImageView]()
    var snows = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ryan.frame = CGRect(x: ryan.center.x, y: ryanY, width: 90, height: 110)
        
        DispatchQueue.global().async {
            let isRunning = true
            let runLoop = RunLoop.current
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
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
            }
        }
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

    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) { [self] in
            for snow in snows {
                snow.removeFromSuperview()
            }
        }
    }
    
    func createTube() {
        let tube = UIImageView(image: UIImage(named: "tube1"))
        tube.contentMode = .scaleAspectFit
        let x = self.view.frame.width-100
        let y = self.view.frame.height/2+30
        let rangeX =  CGFloat(Int.random(in: 10...Int(x)))
        let rangeY = y/2+CGFloat(Int.random(in: 0...50))
        tube.frame = CGRect(x: rangeX, y: 210, width: 60, height: 80)
        tubes.append(tube)
        UIView.animate(withDuration: 3, animations: {
            tube.frame = CGRect(x: rangeX, y: rangeY+10, width: 68, height: 88)
            
        }) { _ in
            tube.image = UIImage(named: "tube2")
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                tube.image = UIImage(named: "tube3")
                let snow = UIImageView(image: UIImage(named: "snow"))
                snow.contentMode = .scaleAspectFit
                snow.frame = CGRect(x: rangeX, y: rangeY+50, width: 40, height: 40)
                DispatchQueue.main.async {
                    UIView.animate(withDuration: 0.6, animations: {
                        snow.frame = CGRect(x: rangeX, y: self.view.frame.height, width: 40, height: 40)
                    })
                    self.view.addSubview(snow)
                }
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.7) {
                    tube.image = UIImage(named: "tube1")
                    snow.removeFromSuperview()
                }
            }
        }
        self.view.addSubview(tube)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 7) {
            UIView.animate(withDuration: 3, animations: {
                
                tube.frame = CGRect(x: rangeX, y: rangeY+70, width: 70, height: 90)
                
            }) { _ in
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                    tube.image = UIImage(named: "tube3")
                    let snow = UIImageView(image: UIImage(named: "snow"))
                    snow.contentMode = .scaleAspectFit
                    snow.frame = CGRect(x: rangeX, y: rangeY+120, width: 40, height: 40)
                    DispatchQueue.main.async {
                        UIView.animate(withDuration: 0.6, animations: {
                            snow.frame = CGRect(x: rangeX, y: self.view.frame.height, width: 40, height: 40)
                        })
                        self.view.addSubview(snow)
                    }
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.7) {
                        tube.image = UIImage(named: "tube1")
                        snow.removeFromSuperview()
                    }
                }
            }
        }
    }
}

