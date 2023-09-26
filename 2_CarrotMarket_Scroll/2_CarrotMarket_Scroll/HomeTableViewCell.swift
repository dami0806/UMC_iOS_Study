//
//  HomeTableViewCell.swift
//  2_CarrotMarket_Scroll
//
//  Created by 박다미 on 2023/09/26.
//

import Foundation
import UIKit
import SnapKit

class HomeTableViewCell : UITableViewCell {
    static let reuseIdentifier = "HomeTableViewCell"
    
    //데이터 정보들
    
    lazy var goodsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var goodsTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    
    
    
    lazy var goodsPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addSubviews() {
        contentView.addSubview(goodsImage)
        contentView.addSubview(goodsTitle)
        contentView.addSubview(locationLabel)
        contentView.addSubview(goodsPrice)
        
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        goodsImage.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(10)
            make.width.equalTo(goodsImage.snp.height)
        }
        goodsTitle.snp.makeConstraints { make in
            make.leading.equalTo(goodsImage.snp.trailing).offset(10)
            make.top.trailing.equalToSuperview().inset(10)
        }
        locationLabel.snp.makeConstraints { make in
            make.leading.equalTo(goodsImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(goodsTitle.snp.bottom).offset(10)
        }
        goodsPrice.snp.makeConstraints { make in
            make.leading.equalTo(goodsImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(locationLabel.snp.bottom).offset(10)
        }
        
    }
}
