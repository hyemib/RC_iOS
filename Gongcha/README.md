# week2

> ์งํ๊ธฐ๊ฐ : 2022.04.16~2022.04.22

## ๐ ์ฃผ์ 

- LiftCycle ํ์ฉ
- ํ๋ฉด ์ ํ ๋ฐ ๋ฐ์ดํฐ ์ ๋ฌ

</br>

## ๐ ์คํํ๋ฉด

<img src="https://user-images.githubusercontent.com/98953443/166107585-65068087-565e-47f3-a081-d2fd00cce66f.gif" width = 300 >

</br>

## ๐ ์ฌ์ฉํ LifeCycle

- `viewWillAppear`

```swift
// ํ์ ์ฐฝ ํ์
override func viewWillAppear(_ animated: Bool) {
    guard let popupVC = storyboard?.instantiateViewController(withIdentifier: "popupVC") as? PopupViewController else { return }
    popupVC.modalPresentationStyle = .overCurrentContext
    self.present(popupVC, animated: false, completion: nil)
}
```

```swift
// ์๋ฆผ ์ฐฝ ํ์
override func viewWillAppear(_ animated: Bool) {
    NotificationCenter.default.addObserver(self, selector: #selector(enterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
}

@objc func enterForeground() {
  	NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
}
```

- `sceneWillResignActive` /` sencDidBecomActinve`

```swift
// ์ค์์ฒ ๋ชจ๋์ผ ๋ ๋ธ๋ฌ ์ฒ๋ฆฌ 
var blurView: UIVisualEffectView?

 func sceneWillResignActive(_ scene: UIScene) {
    // blurView๋ฅผ window ํฌ๊ธฐ๋ก ์ก์์ฃผ๊ณ  window์ ์ถ๊ฐ
    guard let window = window else {
        return
    }
    let effect = UIBlurEffect(style: .regular)
    blurView = UIVisualEffectView(effect: effect)
    blurView?.frame = window.frame
    window.addSubview(blurView!)
}

func sceneDidBecomeActive(_ scene: UIScene) {
    // ์ฑ์ด ๋ค์ ํ์ฑํ ์ํ๊ฐ ๋๋ฉด blurView๋ฅผ window์ ์ ๊ฑฐ
    if let blurView = blurView {
        blurView.removeFromSuperview()
    }
}
```

</br>

## ๐ TIL

[๋ฐ๋ก๊ฐ๊ธฐ](https://github.com/Hhyemm/RC_iOS/blob/main/TIL/2์ฃผ์ฐจ(22.04.16%7E22.04.22).md)

</br>

</br>