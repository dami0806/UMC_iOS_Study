//
//  RatingCustomView.swift
//  2_CarrotMarket_Scroll
//
//  Created by 박다미 on 2023/09/27.
//

import Foundation
import UIKit
import SnapKit

final class RatingCustomView: UIView {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .trailing
        stackView.distribution = .fill
        stackView.backgroundColor = .white
        stackView.spacing = 3
        return stackView
    }()
    
    lazy var heartImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart")
        imageView.tintColor = .gray
        return imageView
    }()
    lazy var heartCount : UILabel = {
        let label = UILabel()
        label.text = "5"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    lazy var talkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bubble.left.and.bubble.right")
        imageView.tintColor = .gray
        return imageView
    }()
    lazy var talkCount : UILabel = {
        let label = UILabel()
        label.text = "3"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .gray
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.backgroundColor = .white
        addSubview()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    private func addSubview(){
        addSubview(stackView)
        
        
        stackView.addArrangedSubview(talkImageView)
        stackView.addArrangedSubview(talkCount)
        
        stackView.addArrangedSubview(heartImageView)
        stackView.addArrangedSubview(heartCount)
        
        
        configureConstraints()
    }
    private func configureConstraints(){
        stackView.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
            make.leading.equalTo(talkImageView.snp.leading)
        }
    }
            
        
    
    
}
