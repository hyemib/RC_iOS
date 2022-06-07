

# week3

> 진행기간 : 2022.04.30~2022.05.06

## 🎵 주제

- SpriteKit을 사용하지 않고 Thread를 이용한 게임 프로그래밍

</br>

## 🎵 실행화면

<img src="https://user-images.githubusercontent.com/98953443/172411988-8a25c850-76b7-4c22-ab97-661775075360.gif" width = 300>

</br>

## 🎵 사용한 Thread

```swift
// 일정 간격으로 튜브 생성
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
```

```swift
// 터치 이벤트가 시작될 때 라이언의 위치 변경
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first!.location(in: self.view)
    DispatchQueue.main.async {
        UIView.animate(withDuration: 0.3) {
            self.ryan.frame = CGRect(x: touch.x, y: self.ryanY, width: 90, height: 110)
            self.ryanPosition = touch.x
        }
    }
  
// 라이언의 위치를 기준으로 눈 생성 및 이동 
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
```

```swift
// 터치 이벤트가 끝났을 때 눈 제거
override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) { [self] in
        for snow in snows {
            snow.removeFromSuperview()
        }
    }
  	// 튜브가 눈을 3번 맞은 경우 이미지 변경 후 제거 
  	key.image = UIImage(named: "tube4")
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
         key.removeFromSuperview()

    }
}
```

```swift
// 튜브 위치를 기준으로 눈 생성
DispatchQueue.main.async() {
    self.makeSonow(tube: tube, rangeX: tube.frame.minX, rangeY: tube.frame.minY, tubePositionX: tubeX)
}
```

```swift
// 눈 이동 및 라이언이 눈을 맞은 경우 이미지 변경
 DispatchQueue.main.async {
    UIView.animate(withDuration: 1.5, animations: {
        snow.frame = CGRect(x: tubePositionX, y: self.view.frame.height, width: 40, height: 40)
    }) { _ in
        if self.ryan.frame.minX <= tubePositionX && self.ryan.frame.maxX >= tubePositionX {
            self.ryan.image = UIImage(named: "ryan1-2")
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                self.ryan.image = UIImage(named: "ryan1-1")
            }
            self.changeHeart()
        }
    }
  	self.view.addSubview(snow)
}
```

</br>

## 🎵 TIL

[바로가기](https://github.com/Hhyemm/RC_iOS/blob/main/TIL/4주차(22.04.30%7E22.05.06).md)

</br>

