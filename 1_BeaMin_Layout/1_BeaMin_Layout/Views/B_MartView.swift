//
//  B_MartView.swift
//  1_BeaMin_Layout
//
//  Created by 박다미 on 2023/09/22.
//

import Foundation
import UIKit

final class B_MartView: UIView{
    
    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
   lazy var titleLabel: UILabel = {
           let label = UILabel()
           label.text = "MANNDA"
        label.textAlignment = .left
           label.font = UIFont.systemFont(ofSize: 13)
           return label
       }()
    lazy var saleLabel: UILabel = {
              let label = UILabel()
              label.text = "44%"
           label.textColor = UIColor.orange
           label.textAlignment = .left
              label.font = UIFont.boldSystemFont(ofSize: 16)
              return label
          }()
     lazy var originPriceLabel: UILabel = {
              let label = UILabel()
              label.text = "MANNDA"
           label.textAlignment = .left
              label.font = UIFont.systemFont(ofSize: 13)
           label.textColor = UIColor.lightGray
           label.attributedText = label.text?.strikeThrough()
           return label
          }()
      lazy var salePriceLabel: UILabel = {
              let label = UILabel()
              label.text = "4,050원"
           label.textAlignment = .left
           label.font = UIFont.boldSystemFont(ofSize: 18)
              return label
          }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - addSubviews()
    private func addSubviews(){
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(saleLabel)
        addSubview(originPriceLabel)
        addSubview(salePriceLabel)
        
        configureConstraints()

    }
    //MARK: - configureConstraints()
    private func configureConstraints() {
        imageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(0)
            make.top.equalToSuperview().inset(3)
            make.height.equalTo(imageView.snp.width).multipliedBy(0.6)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(0)
            make.top.equalTo(imageView.snp.bottom).offset(8)
        }
        saleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(0)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
        originPriceLabel.snp.makeConstraints { make in
            make.leading.equalTo(salePriceLabel.snp.trailing).offset(8)
            make.centerY.equalTo(saleLabel.snp.centerY)
        }
        salePriceLabel.snp.makeConstraints { make in
            make.leading.equalTo(saleLabel.snp.trailing).offset(8)
            make.centerY.equalTo(saleLabel.snp.centerY)

        }
    }
}
