//
//  RoundRadioButtonView.swift
//  3_BaeMinOrderLogic
//
//  Created by 박다미 on 2023/10/02.
//

import Foundation
import UIKit


class RoundRadioButtonView: UIView {
    private var isChecked: Bool = false
    private let radioButtonCircle: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    private let radioButtonCenter: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
    }
    
    private func addSubviews() {
        backgroundColor = .clear
        addSubview(radioButtonCircle)
        addSubview(radioButtonCenter)
        radioButtonCenter.backgroundColor = .white
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(radioButtonTapped))
        addGestureRecognizer(tapGesture)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        radioButtonCircle.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        radioButtonCenter.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: bounds.width - 8, height: bounds.width - 8))
        }
        radioButtonCircle.layer.cornerRadius = bounds.width / 2
        radioButtonCenter.layer.cornerRadius = bounds.width / 2

    }
    
    func setRadioButtonSelected(_ selected: Bool) {
        isChecked = selected
        radioButtonCenter.backgroundColor = selected ? .blue : .white
    }
    
    @objc private func radioButtonTapped() {
        isChecked.toggle()
        setRadioButtonSelected(isChecked)
        NotificationCenter.default.post(name: NSNotification.Name("RadioButtonSelected"), object: self)
    }
}
