# week2

> 진행기간 : 2022.04.16~2022.04.22

## 📍 주제

- LiftCycle 활용
- 화면 전환 및 데이터 전달

</br>

## 📍 실행화면

<img src="https://user-images.githubusercontent.com/98953443/166107585-65068087-565e-47f3-a081-d2fd00cce66f.gif" width = 300 >

</br>

## 📍 사용한 LifeCycle

- `viewWillAppear`

```swift
// 팝업 창 표시
override func viewWillAppear(_ animated: Bool) {
    guard let popupVC = storyboard?.instantiateViewController(withIdentifier: "popupVC") as? PopupViewController else { return }
    popupVC.modalPresentationStyle = .overCurrentContext
    self.present(popupVC, animated: false, completion: nil)
}
```

```swift
// 알림 창 표시
override func viewWillAppear(_ animated: Bool) {
    NotificationCenter.default.addObserver(self, selector: #selector(enterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
}

@objc func enterForeground() {
  	NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
}
```

- `sceneWillResignActive` /` sencDidBecomActinve`

```swift
// 스위처 모드일 때 블러 처리 
var blurView: UIVisualEffectView?

 func sceneWillResignActive(_ scene: UIScene) {
    // blurView를 window 크기로 잡아주고 window에 추가
    guard let window = window else {
        return
    }
    let effect = UIBlurEffect(style: .regular)
    blurView = UIVisualEffectView(effect: effect)
    blurView?.frame = window.frame
    window.addSubview(blurView!)
}

func sceneDidBecomeActive(_ scene: UIScene) {
    // 앱이 다시 활성화 상태가 되면 blurView를 window에 제거
    if let blurView = blurView {
        blurView.removeFromSuperview()
    }
}
```

</br>

## 📍 TIL

[바로가기](https://github.com/Hhyemm/RC_iOS/blob/main/TIL/2주차(22.04.16%7E22.04.22).md)

</br>

</br>