//
//  HomeCategoryCollectionViewCell.swift
//  2_CarrotMarket
//
//  Created by 박다미 on 2023/09/25.
//

import Foundation
import UIKit
class HomeCategoryCollectionViewCell : UICollectionViewCell {
    
 
        static let reuseIdentifier = "HomeCategoryCollectionViewCell"

 lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 3
        return stackView
    }()

    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
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
                make.edges.equalToSuperview()
            }
            stackView.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.edges.equalToSuperview().inset(3)
            }
        }
        
    }
