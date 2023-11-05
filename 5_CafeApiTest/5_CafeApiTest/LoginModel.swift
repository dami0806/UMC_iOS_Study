//
//  LoginModel.swift
//  5_CafeApiTest
//
//  Created by 박다미 on 2023/11/05.
//

import Foundation
import RxRelay
import RxSwift

class LoginViewModel {
    // Inputs
    let loginButtonTapped = PublishRelay<Void>()

    // Outputs
    let loginSuccess = PublishRelay<Void>()
    let loginError = PublishRelay<Error>()

    private let disposeBag = DisposeBag()
    private let service = LoginService.shared

    init() {
        setupBindings()
    }

    private func setupBindings() {
        loginButtonTapped
            .flatMapLatest { [unowned self] in
                return self.service.login()
            }
            .subscribe(onNext: { [weak self] in
                self?.loginSuccess.accept(())
            }, onError: { [weak self] error in
                self?.loginError.accept(error)
            })
            .disposed(by: disposeBag)
    }
}
