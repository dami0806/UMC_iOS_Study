//
//  Service.swift
//  5_CafeApiTest
//
//  Created by 박다미 on 2023/11/05.
//

import Foundation
import RxSwift
import RxCocoa
import KakaoSDKUser
import RxKakaoSDKUser

//service
class LoginService {
    static let shared = LoginService()
    private let disposeBag = DisposeBag()
    
    private init() {}

    func login() -> Observable<Void> {
        return Observable.create { [unowned self] observer in
            UserApi.shared.rx.loginWithKakaoAccount()
                .materialize()
                .subscribe(onNext: { event in
                    switch event {
                    case .next:
                        print("로그인성공")
                        observer.onNext(())
                    case .error(let error):
                        print(error)
                        observer.onError(error)
                    case .completed:
                        break
                    }
                })
                .disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }
}
