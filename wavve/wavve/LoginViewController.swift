
import UIKit
import KakaoSDKAuth
import KakaoSDKUser
import GoogleSignIn

class LoginViewController: UIViewController {

    weak var delegate: SendDelegate?
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var kakaoView: UIView!
    @IBOutlet weak var googleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idTextField.layer.cornerRadius = 5
        passTextField.layer.cornerRadius = 5
        loginBtn.layer.cornerRadius = 30
        kakaoView.layer.cornerRadius = kakaoView.frame.width / 2
        googleView.layer.cornerRadius =  googleView.frame.width / 2
    }
    
    @IBAction func returnButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    //앱으로 로그인
    // 카카오 로그인 버튼 클릭 시
    
    @IBAction func kakaoLoginButtonPress(_ sender: Any) {
        if UserApi.isKakaoTalkLoginAvailable() {
            // 카카오톡 로그인. api 호출 결과를 클로저로 전달.
            loginWithApp()
        } else {
            // 만약, 카카오톡이 깔려있지 않을 경우에는 웹 브라우저로 카카오 로그인함.
            loginWithWeb()
        }
    }
    @IBAction func googleLoginButtonPress(_ sender: Any) {
        let config = GIDConfiguration(clientID: "1014023707688-2a9a4r639rv1n4e5njf3vc5mjou9uqgv.apps.googleusercontent.com")
                
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { user, error in
            if error != nil { return }
            guard let userName = user?.profile?.name else { return }
            self.delegate?.send(name: userName)
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }
        
    }
}

// MARK: - Kakao Login Extensions

extension LoginViewController {
    
    // 카카오톡 앱으로 로그인
    func loginWithApp() {
        UserApi.shared.loginWithKakaoTalk {(_, error) in
            if let error = error {
                print(error)
            } else {
                print("loginWithKakaoTalk() success.")
                UserApi.shared.me {(user, error) in
                    if let error = error {
                        print(error)
                    } else {
                        self.delegate?.send(name: user?.kakaoAccount?.profile?.nickname ?? "")
                        self.presentingViewController?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    // 카카오톡 웹으로 로그인
    func loginWithWeb() {
        UserApi.shared.loginWithKakaoAccount {(_, error) in
            if let error = error {
                print(error)
            } else {
                print("loginWithKakaoAccount() success.")
                
                UserApi.shared.me {(user, error) in
                    if let error = error {
                        print(error)
                    } else {
                        self.delegate?.send(name: user?.kakaoAccount?.profile?.nickname ?? "")
                        self.presentingViewController?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
}
