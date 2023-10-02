//
//  Test.swift
//  3_BaeMinOrderLogic
//
//  Created by 박다미 on 2023/10/01.
//

import Foundation

import UIKit
import SnapKit

class Test: UIViewController {

    var cartCount = 0 // 장바구니 아이템 수를 저장하는 변수

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        settingNaviItem() // 네비게이션 아이템 설정 메서드 호출
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(30)
        }
    }

    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add to Cart", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.gray, for: .normal)
        button.setTitleColor(.black, for: .selected)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    private func settingNaviItem() {
        let backBtn = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(buttonTapped))
        let homeBtn = UIBarButtonItem(image: UIImage(systemName: "house"), style: .plain, target: self, action: #selector(buttonTapped))
        let shareBtn = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(buttonTapped))

        // "cart" 버튼을 위한 커스텀 뷰 생성
        let cartButtonView = UIView()
        cartButtonView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)

        // "cart" 버튼을 위한 커스텀 UIButton 생성
        let cartButton = UIButton(type: .custom)
        cartButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        cartButton.setImage(UIImage(systemName: "cart"), for: .normal)
        cartButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)

        // 숫자를 표시하는 UILabel 생성
        let cartCountLabel = UILabel()
        cartCountLabel.frame = CGRect(x: 20, y: 0, width: 15, height: 15)
        cartCountLabel.backgroundColor = .red
        cartCountLabel.textColor = .white
        cartCountLabel.textAlignment = .center
        cartCountLabel.font = UIFont.systemFont(ofSize: 10)
        cartCountLabel.layer.cornerRadius = 7.5
        cartCountLabel.layer.masksToBounds = true
        cartCountLabel.text = "\(cartCount)" // 초기 숫자 설정

        // 커스텀 뷰에 "cart" 버튼과 숫자 레이블 추가
        cartButtonView.addSubview(cartButton)
        cartButtonView.addSubview(cartCountLabel)

        // 커스텀 뷰를 이용해 UIBarButtonItem 생성
        let cartBtn = UIBarButtonItem(customView: cartButtonView)

        navigationController?.navigationBar.barTintColor = .white

        // 네비게이션 바에 아이템 설정
        navigationItem.rightBarButtonItems = [cartBtn, shareBtn, homeBtn]
        navigationItem.leftBarButtonItem = backBtn
    }

    @objc func buttonTapped() {
        // 버튼을 누를 때마다 cartCount를 증가시키고 레이블을 업데이트
        cartCount += 1
        if let cartButtonView = navigationItem.rightBarButtonItem?.customView as? UIView,
           let cartCountLabel = cartButtonView.subviews.first(where: { $0 is UILabel }) as? UILabel {
            cartCountLabel.text = "\(cartCount)"
        }
    }

    @objc func cartButtonTapped() {
    }
}
