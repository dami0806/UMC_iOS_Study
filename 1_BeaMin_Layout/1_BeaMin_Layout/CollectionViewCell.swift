//
//  CollectionViewCell.swift
//  1_BeaMin_Layout
//
//  Created by 박다미 on 2023/09/19.
//

import UIKit
import SnapKit

class ShopAddCollectionViewCell: UICollectionViewCell {
    
    var uiView = UIView()
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
        contentView.addSubview(uiView)
        uiView.addSubview(imageView)
        
        uiView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(uiView)
        }
    }
    func configure(with image: UIImage) {
        imageView.image = image
        
        
    }
}
//MARK: -FastdeliveryCollectionViewCell
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
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
     lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    //배달
     lazy var deliveryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = .lightGray
        label.text = "배달"
        label.numberOfLines = 1
        return label
    }()
     lazy var deliveryTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = .gray
        label.numberOfLines = 1
        return label
    }()
    //배달팁
     lazy var deliveryTipLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .lightGray
        label.text = "배달팁"
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 1
        return label
    }()
     lazy var deliveryTipTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 1
        return label
    }()
     lazy var uiImageView: UIImageView = {
        let uiImageView = UIImageView()
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
            make.leading.trailing.equalToSuperview().inset(3)
        }
    }
    
}


//MARK: - ShopMobileGiftsCollectionViewCell
class ShopMobileGiftsCollectionViewCell: UICollectionViewCell {
    lazy var containView: UIView = {
         let view = UIView()
        view.backgroundColor = .white
         return view
     }()
   lazy var view: UIView = {
        let view = UIView()
       view.backgroundColor = .white
        return view
    }()
    var imageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupCell()
    }
    
    private func setupCell() {
        setupViewUI()
        addSubview(containView)
        containView.addSubview(view)
        view.addSubview(imageView)
        containView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
        view.snp.makeConstraints { make in
            make.leading.trailing.equalTo(containView)
            make.top.equalToSuperview().inset(10)
            make.height.equalTo(view.snp.width).multipliedBy(0.35)
        }
        imageView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(2)
            make.top.bottom.equalTo(view).inset(4)
            
        }
    }
    private func setupViewUI(){
        view.layer.cornerRadius = 5
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.3 //0일수록 투명
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 4 //0일수록 흐릿
        view.layer.masksToBounds = false


    }
}
//MARK: -ShopBestItemsCollectionViewCell
class ShopBestItemsCollectionViewCell: UICollectionViewCell {
    var uiView = UIView()
    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 2
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
        contentView.addSubview(uiView)
        uiView.addSubview(imageView)
        uiView.addSubview(label)
        
        uiView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        imageView.snp.makeConstraints { make in
            make.centerX.equalTo(uiView.snp.centerX)
            make.top.equalTo(uiView.snp.top).inset(5)
            make.width.height.equalTo(uiView.snp.width).multipliedBy(0.9)
            make.height.equalTo(imageView.snp.width)
        }
        
        
        label.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.leading.equalTo(imageView.snp.leading)
            make.trailing.equalTo(imageView.snp.trailing)
            
        }
    }
    
}

