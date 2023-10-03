//
//  BottomGetView.swift
//  3_BaeMinOrderLogic
//
//  Created by 박다미 on 2023/10/02.
//

import Foundation
import UIKit
import SnapKit

class BottomGetView:UIView {
    lazy var minCostLabel : UILabel = {
        let lb = UILabel()
        lb.text = "배달최소주문금액"
        lb.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lb.textColor = .lightGray
        return lb
    }()
    lazy var minCost : UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lb.textColor = .black
        lb.text = "17,900원"
        
        return lb
    }()
    lazy var view: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor.logoColor
        view.layer.masksToBounds = true
        return view
    }()
    lazy var getLabel : UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lb.textColor = .white
        lb.text = "10,000원 담기"
        
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    private func addSubviews() {
        addSubview(minCostLabel)
        addSubview(minCost)
        addSubview(view)
        view.addSubview(getLabel)
        configureConstraints()
    }
    private func configureConstraints() {
        minCostLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.leading.equalToSuperview().inset(10)
        }
        minCost.snp.makeConstraints { make in
            make.top.equalTo(minCostLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(15)
        }
        view.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(10)
            make.leading.equalTo(minCostLabel.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        getLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
    }
    
    
}
