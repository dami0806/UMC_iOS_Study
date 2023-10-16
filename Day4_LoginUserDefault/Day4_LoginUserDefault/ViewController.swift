import UIKit
import SnapKit

class ViewController: UIViewController {
    //아이디
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.borderStyle = .roundedRect
        return textField
    }()
    //비번
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    //UserDefaults와 확인
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    //UserDefaults 데이터 넣기
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.backgroundColor = .green
        return button
    }()
    //UserDefaults 데이터 삭제
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("탈퇴", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    //상태: 1. 텍스트필드 다 채워졌는지 > 정보가 일치하는지
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
  
        addSubviews()
        // 로그인 상태 확인 및 자동 로그인 처리
        if UserDefaults.standard.bool(forKey: "isUserLoggedIn") {
            let savedUsername = UserDefaults.standard.string(forKey: "username") ?? ""
            let savedPassword = UserDefaults.standard.string(forKey: "password") ?? ""
            usernameTextField.text = savedUsername
            passwordTextField.text = savedPassword
            loginButtonTapped(loginButton) // 자동 로그인 시도
        }//아님말고
    }
    private func addSubviews(){
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
        view.addSubview(logoutButton)
        view.addSubview(statusLabel)
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        configureConstraints()
    }
    private func configureConstraints() {
        usernameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-200)
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(usernameTextField.snp.bottom).offset(20)
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        logoutButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signUpButton.snp.bottom).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoutButton.snp.bottom).offset(20)
        }
    }
    //로그인 버튼
    @objc func loginButtonTapped(_ sender: UIButton) {
        
        let savedUsername = UserDefaults.standard.string(forKey: "username") ?? ""
        let savedPassword = UserDefaults.standard.string(forKey: "password") ?? ""
        
        // 입력된 아이디와 비밀번호 가져오기
        guard let enteredUsername = usernameTextField.text, !enteredUsername.isEmpty,
              let enteredPassword = passwordTextField.text, !enteredPassword.isEmpty else {
            statusLabel.text = "아이디와 비밀번호를 모두 입력하세요."
            return
        }
        
        // 아이디와 비밀번호 검증
        if enteredUsername == savedUsername && enteredPassword == savedPassword {
            // 로그인 성공
            UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
            statusLabel.text = "로그인 성공!"
            // 로그인 후 다음 화면으로 전환하거나 다른 작업 수행
            let vc = NextViewController()
            navigationController?.pushViewController(vc, animated: true)
            guard let usernameLabel = usernameTextField.text else {return}
            guard let passwordLabel = passwordTextField.text else {return}

            vc.userName = usernameLabel
            vc.password = passwordLabel
            
      
        } else {
            // 로그인 실패
            statusLabel.text = "아이디 또는 비밀번호가 잘못되었습니다."
            UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        }
    }
    
    @objc func signUpButtonTapped(_ sender: UIButton) {
      
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        // 입력된 아이디와 비밀번호 가져오기
        guard let enteredUsername = usernameTextField.text, !enteredUsername.isEmpty,
              let enteredPassword = passwordTextField.text, !enteredPassword.isEmpty else {
            statusLabel.text = "아이디와 비밀번호를 모두 입력하세요."
            return
        }
        
        UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(password, forKey: "password")
        statusLabel.text = "회원가입 완료!"
    }
    
    @objc func logoutButtonTapped(_ sender: UIButton) {
        // 로그아웃 시 UserDefaults에서 로그인 정보 제거
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "password")
        statusLabel.text = "로그아웃되었습니다."
    }
}
