//
//  SecondCustomCollectionCell.swift
//  1_BeaMin_Layout
//
//  Created by 박다미 on 2023/09/19.
//

import UIKit
import SnapKit

///mark: - 알뜰어쩌구 아이템 많은거 collection
class SecondCustomCollectionCell: UICollectionViewCell {
    static let reuseIdentifier = "SecondCustomCollectionCell"
    
    //이미지 뷰
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // 텍스트 레이블
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(5)
            make.height.equalTo(imageView.snp.width)
            
            
            titleLabel.snp.makeConstraints { make in
                make.top.equalTo(imageView.snp.bottom).offset(5)
                make.centerX.equalTo(imageView.snp.centerX)
            }
        }
        
        
    }
    func configure(image: UIImage, title: String) {
        imageView.image = image
        titleLabel.text = title
    }
}
