//
//  TableViewCell.swift
//  3_BaeMinOrderLogic
//
//  Created by 박다미 on 2023/10/01.
//

import Foundation
import UIKit
import SnapKit

//MARK: - HeaderView
class TableHeaderView: UITableViewHeaderFooterView{
    static let reuseIdentifier = "TableHeaderView"
    
    private let headerTitle : UILabel = {
        let lb = UILabel()
        lb.text = "고구마피자"
        lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lb.textColor = .black
        return lb
    }()
    private let subTitle : UILabel = {
        let lb = UILabel()
        lb.text = "최대 1개 선택"
        lb.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lb.textColor = .lightGray
        return lb
    }()
    private let selectImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "선택")
        return imageView
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(headerTitle)
        contentView.addSubview(subTitle)
        contentView.addSubview(selectImage)

        configureConstraints()
    }
    private func configureConstraints() {
        headerTitle.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(10)

        }
        subTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.top.equalTo(headerTitle.snp.bottom).offset(10)
        }
        selectImage.snp.makeConstraints { make in
            make.centerY.equalTo(headerTitle.snp.centerY)
            make.trailing.equalToSuperview().inset(10)
            make.height.width.equalTo(30)
        }
    
    }
    
    func configure(headerTitle: String,subTitle: String, selectImage: UIImage!) {
        self.headerTitle.text = headerTitle
        self.subTitle.text = subTitle
        self.selectImage.image = selectImage
        
    }
}


class RadioBoxTableViewCell: UITableViewCell {
    static let reuseIdentifier = "RadioBoxTableViewCell"
    var radioButtonSelected :Bool = false
    let radioButtonView = CheckBoxButtonView()

    private let menu : UILabel = {
        let lb = UILabel()
        lb.text = "고구마피자"
        lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lb.textColor = .black
        return lb
    }()
    private let price : UILabel = {
        let lb = UILabel()
        lb.text = "최대 1개 선택"
        lb.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lb.textColor = .lightGray
        return lb
    }()

 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addSubviews() {
        contentView.addSubview(radioButtonView)
        contentView.addSubview(menu)
        contentView.addSubview(price)

        configureConstraints()
    }
    private func configureConstraints() {
        radioButtonView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(10)
            make.height.width.equalTo(30)
        }
        menu.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalTo(radioButtonView.snp.trailing).offset(10)

        }
        price.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview().inset(10)
        }
    }
    
    func configure(menu: String,price: Int, radioButtonSelected:Bool) {
        self.menu.text = menu
        self.price.text = "\(price)원"
        self.radioButtonSelected = radioButtonSelected
    }

}


//체크박스 테이블셀
class CheckBoxTableViewCell: UITableViewCell {
    static let reuseIdentifier = "CheckBoxTableViewCell"
    var checkBoxSelected :Bool = false
    let checkButtonView = CheckBoxButtonView()

    private let menu : UILabel = {
        let lb = UILabel()
        lb.text = "asdf"
        lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lb.textColor = .black
        return lb
    }()
    private let price : UILabel = {
        let lb = UILabel()
        lb.text = "pp"
        lb.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lb.textColor = .lightGray
        return lb
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    private func addSubviews() {
        contentView.addSubview(checkButtonView)
        contentView.addSubview(menu)
        contentView.addSubview(price)

        configureConstraints()
    }
    private func configureConstraints() {
        checkButtonView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(10)
            make.height.width.equalTo(30)
        }
        menu.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalTo(checkButtonView.snp.trailing).offset(10)

        }
     
        price.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview().inset(10)
        }
    }
    
    func configure(menu: String, price: Int, checkBoxSelected: Bool) {
        self.menu.text = menu
        self.price.text = "+\(price)원"
        self.checkBoxSelected = checkBoxSelected

    }

}


