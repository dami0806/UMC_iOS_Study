//
//  LoginViewController.swift
//  5_CafeApiTest
//
//  Created by 박다미 on 2023/10/31.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import SnapKit
import KakaoSDKCommon
import RxKakaoSDKCommon
import KakaoSDKAuth
import RxKakaoSDKAuth
import KakaoSDKUser
import RxKakaoSDKUser

final class LoginViewController: UIViewController {
    private let disposeBag = DisposeBag() // DisposeBag를 생성하여 리소스를 정리하기 위해 사용합니다.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Kakao 로그인 이미지를 추가하고 제스처 인식기를 연결합니다.
        let kakaoLoginImageView = UIImageView(image: UIImage(named: "kakao_login_large_narrow"))
        kakaoLoginImageView.isUserInteractionEnabled = true
        view.addSubview(kakaoLoginImageView)
        kakaoLoginImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(150)
        }
        // RxSwift를 사용하여 제스처를 관찰하고 ViewController로 push합니다.
        let tapGesture = UITapGestureRecognizer()
        kakaoLoginImageView.addGestureRecognizer(tapGesture)
        
        tapGesture.rx.event
            .bind { [weak self] _ in
                self?.checkKakaoLogin()
               
            }
            .disposed(by: disposeBag)
        
    }
    
    
    
    // 다음 화면으로 이동하는 메서드
    private func navigateToNextViewController() {
        let nextViewController = ViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    private func checkKakaoLogin(){
        print(UserApi.shared.rx.loginWithKakaoAccount())
        UserApi.shared.rx.loginWithKakaoAccount()
            .subscribe(onNext:{ (oauthToken) in
                print("loginWithKakaoAccount() success.")
                self.navigateToNextViewController()

                //do something
                _ = oauthToken
            }, onError: {error in
                print(error)
            })
            .disposed(by: disposeBag)
    }
    private func checkLogin(){
        print(UserApi.isKakaoTalkLoginAvailable())
        // 카카오톡 설치 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                    print("🍎🍎🍎")
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    print("🍎")
                   self.navigateToNextViewController()
                    //do something
                    _ = oauthToken
                }
            }
        }
        else {
            print("🍎계정로그인")
            print(UserApi.shared.rx.loginWithKakaoAccount())
            UserApi.shared.rx.loginWithKakaoAccount()
                .subscribe(onNext:{ (oauthToken) in
                    print("loginWithKakaoAccount() success.")

                    //do something
                    _ = oauthToken
                }, onError: {error in
                    print(error)
                    print("🍎계정로그인안되는중")
                })
                .disposed(by: disposeBag)
        }
    }
    
}
