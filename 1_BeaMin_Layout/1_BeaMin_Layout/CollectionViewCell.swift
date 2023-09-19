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
class ShopAllProductCollectionViewCell: UICollectionViewCell {
    var uiView = UIView()
    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = customFont ?? UIFont.systemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 2
        return label
    }()
    var customFont: UIFont? {
        didSet {
            label.font = customFont
        }
    }
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
            make.top.equalTo(uiView.snp.top).inset(10)
            make.width.height.equalTo(uiView.snp.width).multipliedBy(0.8)
            make.height.equalTo(imageView.snp.width)
        }
        label.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(5)
        }
        layoutIfNeeded()
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.clipsToBounds = true
        
        label.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.centerX.equalTo(uiView.snp.centerX)
            
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

