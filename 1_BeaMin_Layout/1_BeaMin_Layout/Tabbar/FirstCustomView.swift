//
//  FirstCustomView.swift
//  1_BeaMin_Layout
//
//  Created by 박다미 on 2023/09/19.
//
import UIKit
import SnapKit

class CustomView: UIView {
   
    private lazy var titleLabel: UILabel = {
            let label = UILabel()
        label.textAlignment = .left
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = .black
        return label

    }()
    private lazy var subtitleLabel: UILabel = {
            let label = UILabel()
        label.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        titleLabel.textColor = .darkGray
        return label

    }()

    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
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
            make.top.equalToSuperview().inset(3)
            make.leading.equalToSuperview().inset(3)
        }

        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(3)
            make.leading.equalToSuperview().inset(3)        }

        imageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.width.equalTo(super.snp.height).multipliedBy(0.32)
        }
    }

    func configure(title: String, subtitle: String, image: UIImage?) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        imageView.image = image
    }
}
