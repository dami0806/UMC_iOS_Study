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
//수량셀
    class CountHeaderView: UIView {
        private let headerTitle : UILabel = {
            let lb = UILabel()
            lb.text = "수량"
            lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            lb.textColor = .black
            return lb
        }()
       private lazy var view: UIView = {
            let view = UIView()
            view.backgroundColor = .white
           view.layer.borderWidth = 1
           view.layer.cornerRadius = 10
           view.layer.masksToBounds = true
           view.layer.borderColor = UIColor.gray.cgColor
            
            return view
        }()
        
        private var countLabel: UILabel = {
            let label = UILabel()
            label.text = "1"
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 16)
            return label
        }()
        
        private var minusButton: UIButton = {
            let button = UIButton()
            button.tintColor = .black
            button.isEnabled = false
            button.setImage(UIImage(systemName: "minus"), for: .normal)
            button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
            return button
        }()
        
        private var plusButton: UIButton = {
            let button = UIButton()
            button.tintColor = .black

            button.setImage(UIImage(systemName: "plus"), for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
            return button
        }()
        
        private var count: Int = 1 {
               didSet {
                   countLabel.text = "\(count)"
                   minusButton.isEnabled = count > 1
                   TotalPriceManager.shared.totalCount = count
                   TotalPriceManager.shared.totalPrice = count * CheckBoxTableViewCell.totalPrice
               }
           }

        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupUI()
        }
        
        private func setupUI() {
            addSubview(headerTitle)
            addSubview(view)
            view.addSubview(minusButton)
            view.addSubview(countLabel)
            view.addSubview(plusButton)
            headerTitle.snp.makeConstraints { make in
                make.leading.equalToSuperview().inset(20)
                make.centerY.equalToSuperview()
            }
            view.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview().inset(15)
                make.trailing.equalToSuperview().inset(20)
                make.width.equalToSuperview().multipliedBy(0.4)
            }
            countLabel.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
            minusButton.snp.makeConstraints { make in
               // make.trailing.equalTo(countLabel.snp.leading).offset(10)
                make.top.bottom.equalToSuperview().inset(15)
                make.leading.equalToSuperview().inset(10)
                make.width.equalTo(minusButton.snp.height)
            }
            
            plusButton.snp.makeConstraints { make in
               // make.leading.equalTo(countLabel.snp.trailing).offset(10)
                make.top.bottom.equalToSuperview().inset(15)
                make.trailing.equalToSuperview().inset(10)
                make.width.equalTo(plusButton.snp.height)

            }
        }
        
        @objc private func minusButtonTapped() {
            if count > 1 {
                count -= 1
                TotalPriceManager.shared.totalPrice = count * CheckBoxTableViewCell.totalPrice
                print("총가격: \(TotalPriceManager.shared.totalPrice)")

            }
        }
        
        @objc private func plusButtonTapped() {
            count += 1
            TotalPriceManager.shared.totalPrice = count * CheckBoxTableViewCell.totalPrice
            print("총가격: \(TotalPriceManager.shared.totalPrice)")
            BottomGetView().getLabel.text = "\(TotalPriceManager.shared.totalPrice)원 담아두기"

        }
    }





//라디오버튼
class RadioBoxTableViewCell: UITableViewCell {
    static let reuseIdentifier = "RadioBoxTableViewCell"
    var radioButtonSelected :Bool = false
    let radioButtonView = UIView()
    var menuCheckBoxDataArray: [MenuRadio]?
   
    var priceNum: Int = 0
    static var totalPrice: Int = 0
    
    private lazy var checkButtonView: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        return button
    }()
    // 체크 이미지 뷰 추가
    private let checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark")
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true // 기본적으로는 숨김 상태로 시작
        return imageView
    }()
    
    
    private let menu : UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lb.textColor = .black
        return lb
    }()
    private let price : UILabel = {
        let lb = UILabel()
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
        checkButtonView.addSubview(checkImageView)
        
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
        checkImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    @objc private func toggleButtonTapped() {
        // 토글 버튼을 누를 때마다 checkBoxSelected 토글
        radioButtonSelected = !radioButtonSelected
       // print(radioButtonSelected)
        checkImageView.isHidden = !radioButtonSelected
        if let menu = menu.text {
            // 아이템이 체크된 경우 가격을 더하고, 체크 해제된 경우 가격을 빼기
           // let itemPrice = radioButtonSelected ? priceNum : -priceNum
         //   TotalPriceManager.shared.totalPrice += itemPrice * TotalPriceManager.shared.totalCount
        }

        CheckBoxTableViewCell.totalPrice = TotalPriceManager.shared.totalPrice
        // 총 가격을 출력
        print("총개수: \(TotalPriceManager.shared.totalCount)")

        print("총가격: \(CheckBoxTableViewCell.totalPrice)")
        print("checkBoxSelected: \(radioButtonSelected)")
    }
    func configure(menu: String, price: Int, radioButtonSelected: Bool) {
        self.menu.text = menu
        self.priceNum = price
        self.price.text = "\(price)원"
        self.radioButtonSelected = radioButtonSelected
        
    }

}


//체크박스 테이블셀
class CheckBoxTableViewCell: UITableViewCell {
    static let reuseIdentifier = "CheckBoxTableViewCell"
    var checkBoxSelected :Bool = false
    var menuCheckBoxDataArray: [MenuCheckBoxSection]?
    var priceNum: Int = 0
    static var totalPrice: Int = 0
    
    private lazy var checkButtonView: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        return button
    }()
    // 체크 이미지 뷰 추가
    private let checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark")
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true // 기본적으로는 숨김 상태로 시작
        return imageView
    }()
    
    
    private let menu : UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lb.textColor = .black
        return lb
    }()
    private let price : UILabel = {
        let lb = UILabel()
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
        checkButtonView.addSubview(checkImageView)
        
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
        checkImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    @objc private func toggleButtonTapped() {
        // 토글 버튼을 누를 때마다 checkBoxSelected 토글
        checkBoxSelected = !checkBoxSelected
        print(checkBoxSelected)
        checkImageView.isHidden = !checkBoxSelected
        if let menu = menu.text {
            // 아이템이 체크된 경우 가격을 더하고, 체크 해제된 경우 가격을 빼기
            let itemPrice = checkBoxSelected ? priceNum : -priceNum
            //  CheckBoxTableViewCell.totalPrice += itemPrice
            TotalPriceManager.shared.totalPrice += itemPrice * TotalPriceManager.shared.totalCount
        }
        
        CheckBoxTableViewCell.totalPrice = TotalPriceManager.shared.totalPrice
        // 총 가격을 출력
        print("총개수: \(TotalPriceManager.shared.totalCount)")

        print("총가격: \(CheckBoxTableViewCell.totalPrice)")
        
        
    }
    func configure(menu: String, price: Int, checkBoxSelected: Bool) {
        self.menu.text = menu
        self.priceNum = price
        self.price.text = "\(price)원"
        self.checkBoxSelected = checkBoxSelected
        
    }
}
