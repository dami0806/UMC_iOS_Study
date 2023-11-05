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

class LoginViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private let viewModel: LoginViewModel

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let kakaoLoginImageView = UIImageView(image: UIImage(named: "kakao_login_large_narrow"))
        kakaoLoginImageView.isUserInteractionEnabled = true
        view.addSubview(kakaoLoginImageView)
        kakaoLoginImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(150)
        }

        let tapGesture = UITapGestureRecognizer()
        kakaoLoginImageView.addGestureRecognizer(tapGesture)

        tapGesture.rx.event
            .bind { [weak self] _ in
                self?.viewModel.loginButtonTapped.accept(())
            }
            .disposed(by: disposeBag)

        viewModel.loginSuccess
            .subscribe(onNext: { [weak self] in
                self?.navigateToNextViewController()
            })
            .disposed(by: disposeBag)

        viewModel.loginError
            .subscribe(onNext: { error in
                print(error)
                // Handle error as needed
            })
            .disposed(by: disposeBag)
    }

    private func navigateToNextViewController() {
        let nextViewController = ViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}



