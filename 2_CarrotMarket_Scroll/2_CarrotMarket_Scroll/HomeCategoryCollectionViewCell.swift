//
//  HomeCategoryCollectionViewCell.swift
//  2_CarrotMarket_Scroll
//
//  Created by 박다미 on 2023/09/26.
//

import Foundation
import UIKit

class HomeCategoryCollectionViewCell : UICollectionViewCell {
    static let reuseIdentifier = "HomeCategoryCollectionViewCell"
    
    lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.categoryGray
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
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
        contentView.addSubview(view)
        view.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        view.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(5)
        }
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(view.snp.height).multipliedBy(0.3)
        }
        
        
    }
 
    
}


class HomeAdCollectionViewCell : UICollectionViewCell {
    
    static let reuseIdentifier = "HomeAdCollectionViewCell"
    
    lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    lazy var goodsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var goodsTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .darkGray
        label.numberOfLines = 2
        return label
    }()
    
    lazy var goodsPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
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
        contentView.addSubview(view)
        view.addSubview(goodsImage)
        view.addSubview(goodsTitle)
        view.addSubview(goodsPrice)
 
        
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
       
        
        goodsImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(goodsImage.snp.width)
        }
        
        goodsTitle.snp.makeConstraints { make in
            make.top.equalTo(goodsImage.snp.bottom).offset(8)
            make.leading.trailing.equalTo(view)
        }
        goodsPrice.snp.makeConstraints { make in
            make.top.equalTo(goodsTitle.snp.bottom).offset(8)
            make.leading.trailing.equalTo(view)
            

        }
    }
}
