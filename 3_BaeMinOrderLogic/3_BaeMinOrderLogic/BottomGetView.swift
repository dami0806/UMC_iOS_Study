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
        view.layer.cornerRadius = 5
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

//장바구니에서의 밑애
class BottomCartGetView:UIView {
    lazy var view: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor.logoColor
        view.layer.masksToBounds = true
        return view
    }()
    lazy var totalCountView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        return view
    }()
    lazy var totalCountLabel: UILabel = {
        let lb = UILabel()
        lb.text = "1"
        lb.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        lb.textColor = UIColor.logoColor
        return lb
    }()
    lazy var getLabel : UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lb.textColor = .white
        lb.text = "알뜰배달 주문하기"
        
        return lb
    }()
    lazy var getTotalLabel : UILabel = {
        let lb = UILabel()
        lb.text = "2,5000원"
        lb.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        lb.textColor = .white
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
        
        addSubview(view)
        view.addSubview(totalCountView)
        totalCountView.addSubview(totalCountLabel)
        
        view.addSubview(getLabel)
        view.addSubview(getTotalLabel)
        configureConstraints()
       // print(totalCountView.frame.width)
    }
    private func configureConstraints() {
        
        view.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(10)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        totalCountView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.bottom.equalToSuperview().inset(10)
            make.width.equalTo(totalCountView.snp.height)
        }
        totalCountLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        getLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        getTotalLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(15)
            make.centerY.equalTo(getLabel.snp.centerY)
        }
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        totalCountView.layer.cornerRadius = (super.frame.height*0.25) * 0.5
        print(super.frame.width)
    }
    
}
