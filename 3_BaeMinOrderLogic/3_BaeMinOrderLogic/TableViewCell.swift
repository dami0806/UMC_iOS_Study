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
        let ld = UILabel()
        ld.text = "고구마피자"
        ld.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        ld.textColor = .black
        return ld
    }()
    private let subTitle : UILabel = {
        let ld = UILabel()
        ld.text = "최대 1개 선택"
        ld.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        ld.textColor = .lightGray
        return ld
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
            make.trailing.equalToSuperview()
            make.height.width.equalTo(20)
        }
    
    }
    
    func configure(headerTitle: String,subTitle: String, selectImage: UIImage!) {
        self.headerTitle.text = headerTitle
        self.subTitle.text = subTitle
        self.selectImage.image = selectImage
        
    }
}



//체크박스 테이블셀

class CheckBoxTableViewCell: UITableViewCell {
    static let reuseIdentifier = "CheckBoxTableViewCell"
    var checkBoxSelected :Bool = false

    private let menu : UILabel = {
        let ld = UILabel()
        ld.text = "asdf"
        ld.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        ld.textColor = .black
        return ld
    }()
    private let price : UILabel = {
        let ld = UILabel()
        ld.text = "pp"
        ld.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        ld.textColor = .lightGray
        return ld
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    private func addSubviews() {
 
        contentView.addSubview(menu)
        contentView.addSubview(price)

        configureConstraints()
    }
    private func configureConstraints() {
        
        menu.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(10)

        }
        price.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview().inset(10)
        }
    }
    
    func configure(menu: String,price: String, checkBoxSelected: Bool) {
        self.menu.text = menu
        self.price.text = price
        self.checkBoxSelected = checkBoxSelected

    }

}


class RadioBoxTableViewCell: UITableViewCell {
    static let reuseIdentifier = "RadioBoxTableViewCell"
    var radioButtonSelected :Bool = false

    private let menu : UILabel = {
        let ld = UILabel()
        ld.text = "고구마피자"
        ld.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        ld.textColor = .black
        return ld
    }()
    private let price : UILabel = {
        let ld = UILabel()
        ld.text = "최대 1개 선택"
        ld.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        ld.textColor = .lightGray
        return ld
    }()

 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addSubviews() {
 
        contentView.addSubview(menu)
        contentView.addSubview(price)

        configureConstraints()
    }
    private func configureConstraints() {
        
        menu.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(10)

        }
        price.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview().inset(10)
        }
    }
    
    func configure(menu: String,price: String, radioButtonSelected:Bool) {
        self.menu.text = menu
        self.price.text = price
        self.radioButtonSelected = radioButtonSelected
    }

}

