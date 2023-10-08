//
//  TableViewCell.swift
//  3_BaeMinOrderLogic
//
//  Created by 박다미 on 2023/10/01.
//

import Foundation
import UIKit
import SnapKit
import RxSwift


//MARK: - HeaderView
class TableHeaderView: UITableViewHeaderFooterView{
    static let reuseIdentifier = "TableHeaderView"
    
    private let headerTopTitle : UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 22, weight: .bold)
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
        contentView.addSubview(detailTitle)
        contentView.addSubview(headerTitle)
        contentView.addSubview(subTitle)
        contentView.addSubview(detailTitle)
        contentView.addSubview(selectImage)
        contentView.addSubview(headerTopTitle)
        
        configureConstraints()
    }
    private func configureConstraints() {
        
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
            make.trailing.equalToSuperview().inset(10)
            make.height.width.equalTo(contentView.snp.width).multipliedBy(0.1)
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
    private let disposeBag = DisposeBag()

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
        return button
    }()
    
    private var plusButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.setTitleColor(.black, for: .normal)
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
            make.top.bottom.equalToSuperview().inset(20)
            make.height.equalTo(view.frame.width).multipliedBy(0.15)
            
        }
        view.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(20)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(view.frame.width).multipliedBy(0.15)
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
        //버튼은 싱글톤 변수 변화 -> 변수는 label구독중
        minusButton.rx.tap
            .subscribe(onNext:{[weak self] in
                guard let self = self else{ return}
                if count > 1 {
                    count -= 1
                    TotalPriceManager.shared.totalCount = count
                    TotalPriceManager.shared.totalPrice = (TotalPriceManager.shared.totalCount) * (TotalPriceManager.shared.totalPricePer)
                }
            } )
            .disposed(by: disposeBag)
        
        plusButton.rx.tap
            .subscribe(onNext: {[weak self] in
                guard let self = self else{return}
                count += 1
                TotalPriceManager.shared.totalCount = count
                TotalPriceManager.shared.totalPrice = (TotalPriceManager.shared.totalCount) * (TotalPriceManager.shared.totalPricePer)
            })
    }
}


//맨위 이미지 바로 아래 설명있는 셀
class TitleTableViewCell : UITableViewCell {
    private let disposeBag = DisposeBag()
    static let reuseIdentifier = "TitleTableViewCell"
    
    //고구마피자
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "고구마피자"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        return label
    }()
//설명
    private lazy var subLabel: UILabel = {
        let label = UILabel()
        label.text = "고구마무스_쭈욱_고구마깍둑썰기 \n달콤하고 부드러운 고구마무스와 고구마 다이스토핑 \n의 씹히는맛의 피자"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .lightGray
        return label
    }()
    //이미지
    private lazy var ingredientImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "성분보기")
        image.contentMode = .scaleAspectFit
        return image
    }()
    private lazy var menuReviewImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "메뉴리뷰")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var menuReviewLabel: UILabel = {
        let label = UILabel()
        label.text = "메뉴 리뷰 1개>"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func addSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(subLabel)
        contentView.addSubview(ingredientImage)
        contentView.addSubview(menuReviewImage)
        contentView.addSubview(menuReviewLabel)
        configureConstraints()
    }
    private func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(10)
        }
        subLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(10)
        }
        ingredientImage.snp.makeConstraints { make in
            make.top.equalTo(subLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(10)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.5)
            make.height.equalTo(ingredientImage.snp.width).multipliedBy(0.2)
        }
        menuReviewImage.snp.makeConstraints { make in
            make.top.equalTo(ingredientImage.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(10)
            make.width.height.equalTo(30)
            make.bottom.equalToSuperview().inset(10)

        }
        menuReviewLabel.snp.makeConstraints { make in
            make.centerY.equalTo(menuReviewImage.snp.centerY)
            make.leading.equalTo(menuReviewImage.snp.trailing).offset(5)
            
        }
        
    }
    
}

class RadioBoxViewModel{
    
}
//라디오버튼 rx 사용전
class RadioBoxTableViewCell: UITableViewCell {
    static let reuseIdentifier = "RadioBoxTableViewCell"
    private var viewModel = RadioBoxViewModel()
    private let disposeBag = DisposeBag()

    var radioButtonSelected :Bool = false
    var menuRadioDataArray: [MenuRadioBoxSection]?
    var priceNum: Int = 0
    var sectionNum:Int = 1
    static var totalPrice: Int = 0
    //선택된 배열
    
    lazy var checkUIView :UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 2
        view.backgroundColor = .white
        return view
    }()
    lazy var checkButtonView: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .clear
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        return button
    }()
    // 체크 이미지 뷰 추가
    private let checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "circle.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
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
        contentView.addSubview(checkUIView)
        checkUIView.addSubview(checkButtonView)
        
        contentView.addSubview(menu)
        contentView.addSubview(price)
        checkButtonView.addSubview(checkImageView)
        
        configureConstraints()
    }
    private func configureConstraints() {
        checkUIView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(10)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.55)
            make.width.equalTo(checkUIView.snp.height)
        }
        menu.snp.makeConstraints { make in
            make.centerY.equalTo(checkUIView.snp.centerY)
            make.leading.equalTo(checkButtonView.snp.trailing).offset(10)
            
        }
        checkButtonView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        price.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalTo(checkUIView.snp.centerY)
        }
        checkImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(7)
        }
    }
    
    // 뷰 생성 후에 원 모양으로 설정
    override func layoutSubviews() {
        super.layoutSubviews()
        checkUIView.layer.cornerRadius = contentView.frame.height * 0.55 * 0.5
        TotalPriceManager.shared.totalPrice = TotalPriceManager.shared.totalPricePer
    }

    
    @objc private func toggleButtonTapped() {
           guard var sectionDataArray = menuRadioDataArray?[sectionNum - 1].menu else {
               return
           }

           // 현재 라디오 버튼 선택 상태 토글
        if radioButtonSelected == true {

        }else{
            radioButtonSelected.toggle()
        }
            var previousItemPrice = 0

        if radioButtonSelected {
            guard var sectionDataArray = menuRadioDataArray?[sectionNum - 1].menu else {
                return
            }
            for data in sectionDataArray {
                if data.menu != menu.text {
                    previousItemPrice = data.price
                    TotalPriceManager.shared.totalPricePer -= previousItemPrice
                   // print("🙌🏻data\(data)")

                }else{
                    TotalPriceManager.shared.totalPricePer +=  data.price

                    TotalPriceManager.shared.selectedMenuItems.removeAll()
                    TotalPriceManager.shared.selectedMenuItems.append(MenuCheckBox(checkBoxSelected: radioButtonSelected, menu: data.menu, price: priceNum, sectionNum: sectionNum))

                    TotalPriceManager.shared.totalPrice = TotalPriceManager.shared.selectedMenuItems.reduce(0) { $0 + ($1.checkBoxSelected ? $1.price * TotalPriceManager.shared.totalCount : 0) }

                }

            }
        }
    }
    func configure(menu: String, price: Int, checkBoxSelected: Bool,sectionNum : Int) {
        self.menu.text = menu
        self.priceNum = price
        self.price.text = "+\(numberWithComma(price))원"
        self.radioButtonSelected = checkBoxSelected
        self.sectionNum = sectionNum
        
    }
    private func calculate(){
        
        if radioButtonSelected {
            guard var sectionDataArray = menuRadioDataArray?[sectionNum - 1].menu else {
                return
            }
            if let menu = menu.text {
                // 아이템이 체크된 경우 가격을 더하고, 체크 해제된 경우 가격을 빼기
                let itemPrice = radioButtonSelected ? priceNum : -priceNum
                
                TotalPriceManager.shared.totalPricePer += itemPrice
                
                // 다른 인덱스의 버튼들 해제
                for (index, var data) in sectionDataArray.enumerated() {
                    if index != self.tag {
                        data.checkBoxSelected = false
                    }
                    sectionDataArray[index] = data
                }
                
                // TotalPriceManager의 선택된 메뉴 항목 배열을 업데이트
                TotalPriceManager.shared.selectedMenuItems.removeAll()
                TotalPriceManager.shared.selectedMenuItems.append(MenuCheckBox(checkBoxSelected: radioButtonSelected, menu: menu, price: priceNum, sectionNum: sectionNum))
                
                TotalPriceManager.shared.totalPrice = TotalPriceManager.shared.selectedMenuItems.reduce(0) { $0 + ($1.checkBoxSelected ? $1.price * TotalPriceManager.shared.totalCount : 0) }
              
            }
        }
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
    private let disposeBag = DisposeBag()

    lazy var checkUIView :UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 2
        view.backgroundColor = .white
        return view
    }()
    lazy var checkButtonView: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .clear
        button.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        return button
    }()
    // 체크 이미지 뷰 추가
     let checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
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
        contentView.addSubview(checkUIView)
        checkUIView.addSubview(checkButtonView)
        
        contentView.addSubview(menu)
        contentView.addSubview(price)
        checkButtonView.addSubview(checkImageView)
        
        configureConstraints()
    }
    private func configureConstraints() {
        checkUIView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(10)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.55)
            make.width.equalTo(checkUIView.snp.height)
            
        }
        menu.snp.makeConstraints { make in
            make.centerY.equalTo(checkUIView.snp.centerY)
            make.leading.equalTo(checkButtonView.snp.trailing).offset(10)
            
        }
        checkButtonView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        price.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalTo(checkUIView.snp.centerY)
        }
        checkImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(3)
        }
    }
    
    
    @objc private func toggleButtonTapped() {
        // 토글 버튼을 누를 때마다 checkBoxSelected 토글
        checkBoxSelected = !checkBoxSelected
        if checkBoxSelected {
            checkUIView.backgroundColor = UIColor.logoColor
        } else {
            checkUIView.backgroundColor = .white
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
        //선택된 아이템 배열을 순환하면서 체크 되어있으면 (가격 * 현재개수), 아니면 0
            TotalPriceManager.shared.totalPrice = TotalPriceManager.shared.selectedMenuItems.reduce(0) { $0 + ($1.checkBoxSelected ? $1.price * TotalPriceManager.shared.totalCount : 0) }
            
        }
        CheckBoxTableViewCell.totalPrice = TotalPriceManager.shared.totalPricePer * TotalPriceManager.shared.totalCount
    }
    func configure(menu: String, price: Int, checkBoxSelected: Bool,sectionNum : Int) {
        self.menu.text = menu
        self.priceNum = price
        self.price.text = "+\(numberWithComma(price))원"
        self.checkBoxSelected = checkBoxSelected
        self.sectionNum = sectionNum
        
    }
}

//장바구니 테이블뷰 셀
class CartTableViewCell: UITableViewCell {
    static let reuseIdentifier = "CartTableViewCell"
    var sectionNum:Int = 1
    private let disposeBag = DisposeBag()

    //메뉴 이름
    private lazy var cancelBtn : UIButton = {
        let btn = UIButton()
        btn.tintColor = .black
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
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
    
    //메뉴 사진
    private lazy var menuImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
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
        view.countLabel.text = "1"
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
        contentView.backgroundColor = .white
        // setupUI()
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addSubviews(){
        contentView.addSubview(cancelBtn)
        contentView.addSubview(uiView)
        contentView.addSubview(menuName)
        uiView.addSubview(menuImage)
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
        uiView.snp.makeConstraints { make in
            make.top.equalTo(menuName.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(20)
            make.width.height.equalTo(cancelBtn.snp.width).multipliedBy(3)
        }
        menuImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(menuName.snp.bottom).offset(10)
            make.leading.equalTo(uiView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        totalPrice.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(10)
            make.leading.equalTo(uiView
                .snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
            
        }
        
        countBtnView.snp.makeConstraints { make in
            make.top.equalTo(totalPrice.snp.bottom).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(contentView.snp.width).multipliedBy(0.1)
            make.width.equalTo(countBtnView.snp.height).multipliedBy(2)
        }
        optionBtn.snp.makeConstraints { make in
            make.top.equalTo(totalPrice.snp.bottom).offset(10)
            make.trailing.equalTo(countBtnView.snp.leading).offset(-10)
            make.height.equalTo(countBtnView.snp.height)
            make.bottom.equalToSuperview().inset(10)
        }
        optionLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    func configure(menuPrice: String,addDough: String, addPizza: String, addSide: String,addOther: String,totalPrice:Int, sectionNum : Int, totalCount: Int) {
        self.menuPrice.text = "・가격: \(menuPrice)"
        self.addDough.text = "・도우 추가선택: \(addDough)"
        self.addPizza.text = "・피자 추가선택: \(addPizza)"
        self.addSide.text = "・사이드 추가선택: \(addSide)"
        self.addOther.text = "・기타 추가선택: \(addOther)"
        self.totalPrice.text = "\(numberWithComma(totalPrice))원"
        self.sectionNum = sectionNum
        self.countBtnView.countLabel.text = "\(numberWithComma(totalCount))"
        
        // 각 레이블을 데이터에 따라 숨김/표시 처리
        self.addDough.isHidden = addDough.isEmpty
        self.addPizza.isHidden = addPizza.isEmpty
        self.addSide.isHidden = addSide.isEmpty
        self.addOther.isHidden = addOther.isEmpty
    }
    
}

class CartTotalTableViewCell: UITableViewCell {
    static let reuseIdentifier = "CartTotalTableViewCell"
    private let disposeBag = DisposeBag()

    //
    lazy var payCost: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "총 주문금액"
        return label
    }()
    lazy var payCostLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "옵션변경"
        return label
    }()
    //
    lazy var tipCost: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "배달팁"
        return label
    }()
    lazy var tipCostLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "2500원"
        return label
    }()
    //
    private lazy var lineView : UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    //
    lazy var finalPayCost: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "결제예정금액"
        return label
    }()
    lazy var finalPayCostLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "옵션변경"
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
        contentView.addSubview(payCost)
        contentView.addSubview(payCostLabel)
        contentView.addSubview(tipCost)
        contentView.addSubview(tipCostLabel)
        contentView.addSubview(lineView)
        contentView.addSubview(finalPayCost)
        contentView.addSubview(finalPayCostLabel)
        
        configureConstraints()
    }
    private func configureConstraints(){
        payCost.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(10)
        }
        payCostLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        tipCost.snp.makeConstraints { make in
            make.top.equalTo(payCost.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(10)
        }
        tipCostLabel.snp.makeConstraints { make in
            make.top.equalTo(payCost.snp.bottom).offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        lineView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(tipCost.snp.bottom).offset(10)
            make.height.equalTo(1)
        }
        finalPayCost.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        finalPayCostLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
            
        }
        
    }
}
