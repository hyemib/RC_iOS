

# week4

> ์งํ๊ธฐ๊ฐ : 2022.04.30~2022.05.06

## ๐ต ์ฃผ์ 

- SpriteKit์ ์ฌ์ฉํ์ง ์๊ณ  Thread๋ฅผ ์ด์ฉํ ๊ฒ์ ํ๋ก๊ทธ๋๋ฐ

</br>

## ๐ต ์คํํ๋ฉด

<img src="https://user-images.githubusercontent.com/98953443/172411988-8a25c850-76b7-4c22-ab97-661775075360.gif" width = 300>

</br>

## ๐ต ์ฌ์ฉํ Thread

```swift
// ์ผ์  ๊ฐ๊ฒฉ์ผ๋ก ํ๋ธ ์์ฑ
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
// ํฐ์น ์ด๋ฒคํธ๊ฐ ์์๋  ๋ ๋ผ์ด์ธ์ ์์น ๋ณ๊ฒฝ
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first!.location(in: self.view)
    DispatchQueue.main.async {
        UIView.animate(withDuration: 0.3) {
            self.ryan.frame = CGRect(x: touch.x, y: self.ryanY, width: 90, height: 110)
            self.ryanPosition = touch.x
        }
    }
  
// ๋ผ์ด์ธ์ ์์น๋ฅผ ๊ธฐ์ค์ผ๋ก ๋ ์์ฑ ๋ฐ ์ด๋ 
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
// ํฐ์น ์ด๋ฒคํธ๊ฐ ๋๋ฌ์ ๋ ๋ ์ ๊ฑฐ
override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) { [self] in
        for snow in snows {
            snow.removeFromSuperview()
        }
    }
  	// ํ๋ธ๊ฐ ๋์ 3๋ฒ ๋ง์ ๊ฒฝ์ฐ ์ด๋ฏธ์ง ๋ณ๊ฒฝ ํ ์ ๊ฑฐ 
  	key.image = UIImage(named: "tube4")
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
         key.removeFromSuperview()

    }
}
```

```swift
// ํ๋ธ ์์น๋ฅผ ๊ธฐ์ค์ผ๋ก ๋ ์์ฑ
DispatchQueue.main.async() {
    self.makeSonow(tube: tube, rangeX: tube.frame.minX, rangeY: tube.frame.minY, tubePositionX: tubeX)
}
```

```swift
// ๋ ์ด๋ ๋ฐ ๋ผ์ด์ธ์ด ๋์ ๋ง์ ๊ฒฝ์ฐ ์ด๋ฏธ์ง ๋ณ๊ฒฝ
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

## ๐ต TIL

[๋ฐ๋ก๊ฐ๊ธฐ](https://github.com/Hhyemm/RC_iOS/blob/main/TIL/4์ฃผ์ฐจ(22.04.30%7E22.05.06).md)

</br>

