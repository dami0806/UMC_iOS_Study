//
//  CafeTableViewCell.swift
//  5_CafeApiTest
//
//  Created by 박다미 on 2023/10/31.
//

import Foundation
import UIKit

final class CafeTableViewCell : UITableViewCell {
    
    static let reuseIdentifier = "CafeTableViewCell"

    // 제목 레이블
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    // 종류 레이블
    private let phoneNumLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    // 설명 레이블
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    // 초기화 및 레이아웃 설정
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
   
        
        // 제목 레이블
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.top.equalTo(30)
        }
        
        // 종류 레이블
        contentView.addSubview(phoneNumLabel)
        phoneNumLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
        
        // 설명 레이블
        contentView.addSubview(addressLabel)
        addressLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.top.equalTo(phoneNumLabel.snp.bottom).offset(8)
            make.right.equalToSuperview().inset(30)
            make.bottom.equalTo(-30)
        }
    }
    
    func configure(title: String, phoneNum: String, address: String) {
        titleLabel.text = title
        phoneNumLabel.text = phoneNum
        addressLabel.text = address
    }
}
