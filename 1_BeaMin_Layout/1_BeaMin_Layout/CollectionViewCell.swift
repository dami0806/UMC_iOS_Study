//
//  CollectionViewCell.swift
//  1_BeaMin_Layout
//
//  Created by 박다미 on 2023/09/19.
//

import UIKit
import SnapKit

//MARK: - SaleCollectionViewCell
class SaleCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "SaleCollectionViewCell"
    
    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupImageView()
    }
    private func setupImageView() {
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.width.equalTo(contentView).offset(5)
            make.height.equalTo(imageView.snp.width).multipliedBy(0.55)
        }
    }
    
}
//MARK: -FastdeliveryCollectionViewCell:실속있는 알뜰배달
class FastdeliveryCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "FastdeliveryCollectionViewCell"
    
    
    lazy var foodImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    lazy var storeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    //배달
    lazy var deliveryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .lightGray
        label.text = "배달 "
        label.numberOfLines = 1
        return label
    }()
    lazy var deliveryTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .darkGray
        label.numberOfLines = 1
        return label
    }()
    //배달팁
    lazy var deliveryTipLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .lightGray
        label.text = "배달팁 "
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.numberOfLines = 1
        return label
    }()
    lazy var deliveryTipTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.numberOfLines = 1
        return label
    }()
    lazy var uiImageView: UIImageView = {
        let uiImageView = UIImageView()
        uiImageView.image = UIImage(named: "알뜰배달")
        return uiImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addsubView()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    private func addsubView() {
        contentView.addSubview(foodImageView)
        contentView.addSubview(storeLabel)
        contentView.addSubview(scoreLabel)
        contentView.addSubview(deliveryLabel)
        contentView.addSubview(deliveryTextLabel)
        contentView.addSubview(deliveryTipLabel)
        contentView.addSubview(deliveryTipTextLabel)
        contentView.addSubview(uiImageView)
        configureConstraints()
        
    }
    private func configureConstraints(){
        foodImageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(3)
            make.width.equalTo(foodImageView.snp.height)
        }
        storeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(3)
            make.top.equalTo(foodImageView.snp.bottom).offset(3)
        }
        scoreLabel.snp.makeConstraints { make in
            make.leading.equalTo(storeLabel.snp.trailing).offset(1)
            make.centerY.equalTo(storeLabel.snp.centerY)
        }
        deliveryLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(3)
            make.top.equalTo(storeLabel.snp.bottom).offset(3)
        }
        deliveryTextLabel.snp.makeConstraints { make in
            make.leading.equalTo(deliveryLabel.snp.trailing).offset(1)
            make.centerY.equalTo(deliveryLabel.snp.centerY)
            
        }
        
        deliveryTipLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(3)
            make.top.equalTo(deliveryLabel.snp.bottom).offset(3)
            
        }
        deliveryTipTextLabel.snp.makeConstraints { make in
            make.leading.equalTo(deliveryTipLabel.snp.trailing).offset(1)
            make.centerY.equalTo(deliveryTipLabel.snp.centerY)
            
        }
        uiImageView.snp.makeConstraints { make in
            make.top.equalTo(deliveryTipLabel.snp.bottom).offset(3)
            make.leading.equalToSuperview().inset(3)
            make.width.equalTo(foodImageView).multipliedBy(0.7)
            make.height.equalTo(15)
        }
    }
    
}


//MARK: -GiveMindCollectionViewCell:마음을 선물
class GiveMindCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "GiveMindCollectionViewCell"
    var uiView = UIView()
    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        return imageView
    }()
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupImageView()
    }
    
    private func setupImageView() {
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(3)
            make.top.equalToSuperview().inset(5)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(imageView.snp.width).multipliedBy(1.5)
        }
        label.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(3)
            make.leading.trailing.equalToSuperview().offset(3)
            
            
        }
    }
    
}
//MARK: - MartShoppingCollectionViewCell : B마트 장보기
class MartShoppingCollectionViewCell: UICollectionViewCell{
    var isSelectedBorderEnabled: Bool = true {
           didSet {
               layer.cornerRadius = 10
               layer.masksToBounds = true
               layer.borderWidth = isSelectedBorderEnabled ? 2.0 : 0.0
               layer.borderColor = isSelectedBorderEnabled ? UIColor.orange.cgColor : UIColor.clear.cgColor
           }
       }
    var selectedIndexPath: IndexPath?  // 현재 선택된 셀의 인덱스
        var previousSelectedIndexPath: IndexPath?  // 이전에 선택된 셀의 인덱스
    
    static let reuseIdentifier = "MartShoppingCollectionViewCell"
    
    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupImageView()
    }
    
    private func setupImageView() {
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(imageView.snp.width)
        }
        
    }
    
}
//MARK: -GoodTasteCollectionViewCell: 전국의 별미가 한가득
class GoodTasteCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "GoodTasteCollectionViewCell"
    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupImageView()
    }
    
    private func setupImageView() {
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(imageView.snp.width)
        }
        
    }
    
}
