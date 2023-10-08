//
//  CountBtnView.swift
//  3_BaeMinOrderLogic
//
//  Created by 박다미 on 2023/10/03.
//

import Foundation
import UIKit
import SnapKit

class CountBtnView: UIView {
    
var count = 1
    private lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()

     var countLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    private var minusButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.isEnabled = false
        button.setImage(UIImage(systemName: "minus"), for: .normal)
    
        return button
    }()

    private var plusButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.setTitleColor(.black, for: .normal)

        return button
    }()

    // 초기화 메서드
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // UI 설정
    private func setupUI() {
        addSubview(view)
        view.addSubview(countLabel)
        view.addSubview(minusButton)
        view.addSubview(plusButton)

        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        countLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        minusButton.snp.makeConstraints { make in
           // make.trailing.equalTo(countLabel.snp.leading).offset(10)
            make.top.bottom.equalToSuperview().inset(15)
            make.leading.equalToSuperview().inset(10)
            make.width.equalTo(minusButton.snp.height)
        }
        
        plusButton.snp.makeConstraints { make in
           // make.leading.equalTo(countLabel.snp.trailing).offset(10)
            make.top.bottom.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(10)
            make.width.equalTo(plusButton.snp.height)

        }
    }

    @objc private func minusButtonTapped() {
        if count > 1 {
            count -= 1
        }
    }

    // 플러스 버튼 탭 시 동작
    @objc private func plusButtonTapped() {
        count += 1
    }

    // 현재 수량 반환
    func getCurrentCount() -> Int {
        return count
    }
}
