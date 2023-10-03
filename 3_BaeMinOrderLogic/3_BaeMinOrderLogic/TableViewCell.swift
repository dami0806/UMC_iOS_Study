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
    
    private let headerTopTitle : UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        lb.textColor = .black
        return lb
    }()
    private let detailTitle : UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        lb.textColor = .lightGray
        lb.numberOfLines = 0
        return lb
    }()
    
    private let headerTitle : UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lb.textColor = .black
        return lb
    }()

    private let subTitle : UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lb.textColor = .lightGray
        return lb
    }()
    private let selectImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "선택")
        imageView.contentMode = .scaleAspectFit
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
        contentView.addSubview(headerTopTitle)

        contentView.addSubview(headerTitle)
        contentView.addSubview(subTitle)
        contentView.addSubview(detailTitle)
        contentView.addSubview(selectImage)
        contentView.addSubview(headerTopTitle)
        
        configureConstraints()
    }
    private func configureConstraints() {
        //맨위일때
        headerTopTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(20)
            
        }
        detailTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.top.equalTo(headerTopTitle.snp.bottom).offset(10)
        }
        //그 이후 셀
        headerTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(20)
            
        }
      
        subTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(headerTitle.snp.bottom).offset(10)
        }
        selectImage.snp.makeConstraints { make in
            make.centerY.equalTo(headerTitle.snp.centerY)
            make.trailing.equalToSuperview().inset(20)
            make.height.width.equalTo(contentView.snp.width).multipliedBy(0.08)
        }
    }
    func headerconfigure(headerTitle: String,subTitle: String, selectImage: UIImage!) {
        self.headerTopTitle.text = headerTitle
        self.detailTitle.text = subTitle
        self.selectImage.image = selectImage
    
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
                TotalPriceManager.shared.totalCount = count
                print(TotalPriceManager.shared.totalPricePer)
                TotalPriceManager.shared.totalPrice = TotalPriceManager.shared.totalCount * (TotalPriceManager.shared.totalPricePer)
               // print("총가격: \(TotalPriceManager.shared.totalPrice)")

            }
        }
        
        @objc private func plusButtonTapped() {
            count += 1
            TotalPriceManager.shared.totalCount = count

            TotalPriceManager.shared.totalPrice = TotalPriceManager.shared.totalCount * (TotalPriceManager.shared.totalPricePer)
         //   print("총가격: \(TotalPriceManager.shared.totalPrice)")

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
     //   print("총개수: \(TotalPriceManager.shared.totalCount)")

      //  print("총가격: \(CheckBoxTableViewCell.totalPrice)")
      //  print("checkBoxSelected: \(radioButtonSelected)")
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
    var sectionNum:Int = 1
    static var totalPrice: Int = 0
    //선택된 배열
    var selectedItems: [CheckBoxTableViewCell] = []

    lazy var checkButtonView: UIButton = {
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
    
    
     let menu : UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        lb.textColor = .black
        return lb
    }()
     let price : UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        lb.textColor = .black
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
        checkImageView.isHidden = !checkBoxSelected


        // 선택된 항목을 출력
      //  print("선택된 항목들:")
        for item in selectedItems {
      //      print("메뉴: \(item.menu.text ?? ""), 가격: \(item.priceNum)원")
        }
        if let menu = menu.text {
            // 아이템이 체크된 경우 가격을 더하고, 체크 해제된 경우 가격을 빼기
            let itemPrice = checkBoxSelected ? priceNum : -priceNum
            
            TotalPriceManager.shared.totalPricePer += itemPrice
            TotalPriceManager.shared.totalPrice = TotalPriceManager.shared.totalPricePer * TotalPriceManager.shared.totalCount
            // TotalPriceManager의 선택된 메뉴 항목 배열을 업데이트
            if checkBoxSelected {
                TotalPriceManager.shared.selectedMenuItems.append(MenuCheckBox(checkBoxSelected: checkBoxSelected, menu: menu, price: priceNum, sectionNum: sectionNum))
            } else {
                // 만약 항목이 클릭 해제되면 배열에서 제거
                if let index = TotalPriceManager.shared.selectedMenuItems.firstIndex(where: { $0.menu == menu }) {
                    TotalPriceManager.shared.selectedMenuItems.remove(at: index)
                }
            }
            
            // 총 가격을 다시 계산
            //            TotalPriceManager.shared.totalPrice = TotalPriceManager.shared.selectedMenuItems.reduce(0) { $0 + ($1.checkBoxSelected ? $1.price : 0) }
            //                }
            TotalPriceManager.shared.totalPrice = TotalPriceManager.shared.selectedMenuItems.reduce(0) { $0 + ($1.checkBoxSelected ? $1.price * TotalPriceManager.shared.totalCount : 0) }
            
        }
        CheckBoxTableViewCell.totalPrice = TotalPriceManager.shared.totalPricePer * TotalPriceManager.shared.totalCount
    }
    func configure(menu: String, price: Int, checkBoxSelected: Bool,sectionNum : Int) {
        self.menu.text = menu
        self.priceNum = price
        self.price.text = "+\(price)원"
        self.checkBoxSelected = checkBoxSelected
        self.sectionNum = sectionNum
       
    }
}

//장바구니 테이블뷰 셀


class CartTableViewCell: UITableViewCell {
    static let reuseIdentifier = "CartTableViewCell"
    var sectionNum:Int = 1

    //메뉴 이름
    private lazy var cancelBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        return btn
    }()
    private lazy var menuName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "고구마피자"
        return label
    }()
    private lazy var uiView : UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        return view
    }()
    
    //메뉴 사진
    private lazy var menuImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "피자")
        return image
    }()
   private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
       stackView.alignment = .leading
        stackView.spacing = 3
        return stackView
    }()
    //가격
    private lazy var menuPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .lightGray
        label.text = "・가격: M (18,900원)"
        return label
    }()
    //도우
    private lazy var addDough: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .lightGray
        label.text = "・도우 추가선택: "
        label.numberOfLines = 0

        return label
    }()
    //피자
    private lazy var addPizza: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .lightGray
        label.text = "・피자 추가선택: "
        label.numberOfLines = 0

        return label
    }()
    //사이드
    private lazy var addSide: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .lightGray
        label.text = "・사이드 추가선택: "
        label.numberOfLines = 0

        return label
    }()
    //기타
    private lazy var addOther: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .lightGray
        label.text = "・기타 추가선택: "
        label.numberOfLines = 0

        return label
    }()
    
    //총가격
    private lazy var totalPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        label.text = "37,000원"
        return label
    }()
    //옵션번경 버튼, 수량버튼
    private lazy var optionBtn: UIView = {
            let view = UIView()
            view.backgroundColor = .white
            view.layer.borderWidth = 1
            view.layer.cornerRadius = 5
            view.layer.masksToBounds = true
            view.layer.borderColor = UIColor.gray.cgColor
            return view
        }()
    lazy var optionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "옵션변경"
        return label
    }()
    
    private var countBtnView: CountBtnView = {
        let view = CountBtnView()
        return view
    }()
    
    private lazy var menuLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .lightGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       // setupUI()
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addSubviews(){
        contentView.addSubview(cancelBtn)
        contentView.addSubview(menuName)
        contentView.addSubview(menuImage)
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(menuPrice)
        stackView.addArrangedSubview(addDough)
        stackView.addArrangedSubview(addPizza)
        stackView.addArrangedSubview(addSide)
        stackView.addArrangedSubview(addOther)
        //stackView.addArrangedSubview(totalPrice)
        contentView.addSubview(totalPrice)
        contentView.addSubview(optionBtn)
        optionBtn.addSubview(optionLabel)
        contentView.addSubview(countBtnView)
        configureConstraints()
    }
    private func configureConstraints() {
        cancelBtn.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(20)
            make.height.width.equalTo(contentView.snp.width).multipliedBy(0.05)
        }
        menuName.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.centerY.equalTo(cancelBtn.snp.centerY)
        }
        menuImage.snp.makeConstraints { make in
            make.top.equalTo(menuName.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(20)
            make.width.height.equalTo(cancelBtn.snp.width).multipliedBy(3)
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(menuName.snp.bottom).offset(10)
            make.leading.equalTo(menuImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        totalPrice.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(10)
            make.leading.equalTo(menuImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)

        }
     
        countBtnView.snp.makeConstraints { make in
          //  make.trailing.bottom.equalToSuperview().inset(10)
            make.top.equalTo(totalPrice.snp.bottom).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(40)
            make.width.equalTo(countBtnView.snp.height).multipliedBy(2)
        }
        optionBtn.snp.makeConstraints { make in
            make.top.equalTo(totalPrice.snp.bottom).offset(10)
            make.trailing.equalTo(countBtnView.snp.leading).offset(-10)
            make.height.equalTo(countBtnView.snp.height)
        }
        optionLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    func configure(addDough: String, addPizza: String, addSide: String,addOther: String,totalPrice:Int, sectionNum : Int) {
        self.addDough.text = "・도우 추가선택: \(addDough)"
        self.addPizza.text = "・피자 추가선택: \(addPizza)"
        self.addSide.text = "・사이드 추가선택: \(addSide)"
        self.addOther.text = "・기타 추가선택: \(addOther)"
        self.totalPrice.text = "\(totalPrice)원"
        self.sectionNum = sectionNum
        // 각 레이블을 데이터에 따라 숨김/표시 처리
           self.addDough.isHidden = addDough.isEmpty
           self.addPizza.isHidden = addPizza.isEmpty
           self.addSide.isHidden = addSide.isEmpty
           self.addOther.isHidden = addOther.isEmpty
    }

}

