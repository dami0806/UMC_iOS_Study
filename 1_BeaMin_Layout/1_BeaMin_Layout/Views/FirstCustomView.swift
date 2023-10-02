//
//  FirstCustomView.swift
//  1_BeaMin_Layout
//
//  Created by 박다미 on 2023/09/19.
//
import UIKit
import SnapKit

class FirstCustomView: UIView {
   
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label

    }()
    private lazy var subtitleLabel: UILabel = {
            let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.textColor = .darkGray
        return label

    }()

    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
       super.backgroundColor = .white
        super.layer.cornerRadius = 8
        super.layer.masksToBounds = true
        addSubview()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    private func addSubview(){
        
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(imageView)
        configureConstraints()
    }
   

    private func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(8)
        }

        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(8)        }

        imageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.width.equalTo(super.snp.height).multipliedBy(0.5)
        }
    }

    func configure(title: String, subtitle: String, image: UIImage?) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        imageView.image = image
    }
}
