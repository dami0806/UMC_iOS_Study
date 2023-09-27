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


    lazy var heartImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart")
        imageView.tintColor = .gray
        return imageView
    }()
   lazy var heartCount : UILabel = {
        let label = UILabel()
        label.text = "3"
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
       addSubview(talkImageView)
        addSubview(talkCount)
        addSubview(heartImageView)
        addSubview(heartCount)
        
        
        configureConstraints()
    }
    private func configureConstraints(){
           
            heartCount.snp.makeConstraints { make in
                make.trailing.equalToSuperview()
                make.top.bottom.equalToSuperview()
            }
           
            heartImageView.snp.makeConstraints { make in
                make.trailing.equalTo(heartCount.snp.leading).offset(-2)
                make.top.bottom.equalToSuperview()
                make.width.equalTo(heartImageView.snp.height)
            }
        
            talkCount.snp.makeConstraints { make in
                make.trailing.equalTo(heartImageView.snp.leading).offset(-2)
                make.top.bottom.equalToSuperview()

            }
            talkImageView.snp.makeConstraints { make in
                make.trailing.equalTo(talkCount.snp.leading).offset(-2)
                make.top.bottom.equalToSuperview()
                make.width.equalTo(talkImageView.snp.height)
            }
        }
    
}
