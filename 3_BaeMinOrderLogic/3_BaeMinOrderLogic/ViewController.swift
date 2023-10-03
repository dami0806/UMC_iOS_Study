//
//  ViewController.swift
//  3_BaeMinOrderLogic
//
//  Created by 박다미 on 2023/10/01.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private var cartCount = 0
    
    let headerDataManager = HeaderDataManager()
    var headerDataArray: [Header] = []
    
    let menuRadioDataManager = MenuRadioDataManager()
    var menuRadioDataArray: [MenuRadio] = []
    
    let menuCheckBoxDataManager = MenuCheckBoxDataManager()
    var menuCheckBoxDataArray: [MenuCheckBoxSection] = []
    //
    var selectedCheckBoxData: [MenuCheckBox] = []
    // MARK: - UI Elements
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let bottomGetView = BottomGetView()
    
    //네비게이션 상위 버튼들
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupRx()
        fetchData()
    }
    
    private func setupUI(){
        addSubviews()
        settingNaviItem()
    }
    private func setupRx() {
        // Bind cart count to label
        TotalPriceManager.shared._totalPrice
            .map { "\($0)원 담기" }
            .bind(to: bottomGetView.getLabel.rx.text)
            .disposed(by: disposeBag)
        
        // Tap gesture on bottom view
        let getCartGestureRecognizer = UITapGestureRecognizer()
        bottomGetView.view.addGestureRecognizer(getCartGestureRecognizer)
        
        getCartGestureRecognizer.rx.event
            .subscribe(onNext: { [weak self] gestureRecognizer in
                self?.getCartTapped()
            })
            .disposed(by: disposeBag)
    }
    private func fetchData() {
        headerDataManager.makeHeaderData()
        headerDataArray = headerDataManager.getHeaderData()
        
        menuRadioDataManager.makeMenuRadioData()
        menuRadioDataArray = menuRadioDataManager.getMenuRadioData()
        
        menuCheckBoxDataManager.makeMenuCheckBoxData()
        menuCheckBoxDataArray = menuCheckBoxDataManager.getMenuCheckBoxData()
        
        tableView.register(CheckBoxTableViewCell.self, forCellReuseIdentifier: CheckBoxTableViewCell.reuseIdentifier)
        tableView.register(TableHeaderView.self, forHeaderFooterViewReuseIdentifier: TableHeaderView.reuseIdentifier)
        tableView.register(RadioBoxTableViewCell.self, forCellReuseIdentifier: RadioBoxTableViewCell.reuseIdentifier)
        
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(bottomView)
        bottomView.addSubview(tableView)
        view.addSubview(bottomGetView)
        configureConstraints()
    }
    private func configureConstraints() {
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(bottomView.snp.bottom)
        }
        
        
        bottomView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(tableView.snp.bottom)
            
        }
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(1500)
            
        }
        bottomGetView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(view.snp.width).multipliedBy(0.25)
            
            
        }
    }
    private func settingNaviItem(){
        
        
        let backBtn = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(buttonTapped))
        let homeBtn = UIBarButtonItem(image: UIImage(systemName: "house"), style: .plain, target: self, action: #selector(buttonTapped))
        let shareBtn = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(buttonTapped))
        // "cart" 버튼을 위한 커스텀 뷰 생성
        let cartButtonView = UIView()
        cartButtonView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        // "cart" 버튼을 위한 커스텀 UIButton 생성
        let cartButton = UIButton(type: .custom)
        cartButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        cartButton.setImage(UIImage(systemName: "cart"), for: .normal)
        cartButton.addTarget(self, action: #selector(cartBtnTapped), for: .touchUpInside)
        
        // 숫자를 표시하는 UILabel 생성
        let cartCountLabel = UILabel()
        cartCountLabel.frame = CGRect(x: 20, y: 0, width: 15, height: 15)
        cartCountLabel.backgroundColor = .red
        cartCountLabel.textColor = .white
        cartCountLabel.textAlignment = .center
        cartCountLabel.font = UIFont.systemFont(ofSize: 10)
        cartCountLabel.layer.cornerRadius = 7.5
        cartCountLabel.layer.masksToBounds = true
        cartCountLabel.text = "\(cartCount)" // 초기 숫자 설정
        
        // 커스텀 뷰에 "cart" 버튼과 숫자 레이블 추가
        cartButtonView.addSubview(cartButton)
        cartButtonView.addSubview(cartCountLabel)
        
        // 커스텀 뷰를 이용해 UIBarButtonItem 생성
        let cartBtn = UIBarButtonItem(customView: cartButtonView)
        //        let cartBtn = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: #selector(buttonTapped))
        
        
        navigationController?.navigationBar.barTintColor = .white
        
        navigationItem.rightBarButtonItems = [cartBtn,shareBtn,homeBtn]
        navigationItem.leftBarButtonItem = backBtn
        
    }
    func getCartTapped() {
        // 버튼을 누를 때마다 cartCount를 증가시키고 레이블을 업데이트
        cartCount += 1
        if let cartButtonView = navigationItem.rightBarButtonItem?.customView as? UIView,
           let cartCountLabel = cartButtonView.subviews.first(where: { $0 is UILabel }) as? UILabel {
            cartCountLabel.text = "\(cartCount)"
        }
        TotalPriceManager.shared.selectedMenuArray.append(TotalPriceManager.shared.selectedMenuItems)
        TotalPriceManager.shared.totalPriceArray.append(TotalPriceManager.shared.totalPrice)

        
    }
    @objc func cartBtnTapped(){
        let myCartViewController = MyCartViewController()
        myCartViewController.selectedItems = selectedCheckBoxData
        self.navigationController?.pushViewController(myCartViewController, animated: true)
        
    }
    
    @objc func buttonTapped(){
        
    }
    
}



extension ViewController : UITableViewDelegate,UITableViewDataSource {
    // 나머지 테이블 뷰 데이터 소스 및 델리게이트 메서드 구현
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerDataArray.count // 5개의 섹션
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == headerDataArray.count-1{
            let headerView = CountHeaderView()
            let headerData = headerDataArray[section]
            
            return headerView
        }
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableHeaderView.reuseIdentifier) as! TableHeaderView
        let headerData = headerDataArray[section]
        
        headerView.configure(headerTitle: headerData.headerTitle, subTitle: headerData.subTitle, selectImage: headerData.selectImage)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == headerDataArray.count-1 {
            return 80
        }
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        else if section == 1 {
            return menuRadioDataArray.count
        }
        else if section == headerDataArray.count-1{
            return 0
        }
        else{
            
            return menuCheckBoxDataArray[section-2].menu.count
            
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 첫 번째 섹션(인덱스 0)은 라디오 버튼 데이터로 설정
        if indexPath.section == 0 {
            return UITableViewCell()
            
        } else if indexPath.section == 1 {
            let radioTableViewCell = tableView.dequeueReusableCell(withIdentifier: RadioBoxTableViewCell.reuseIdentifier, for: indexPath) as! RadioBoxTableViewCell
            
            let radioData = menuRadioDataArray[indexPath.row]
            
            radioTableViewCell.configure(menu: radioData.menu, price: radioData.price, radioButtonSelected: radioData.radioButtonSelected)
            radioTableViewCell.selectionStyle = .none
            return radioTableViewCell
            
        } else {
            // 섹션 2부터 이후의 셀은 체크박스로
            let checkBoxTableViewCell = tableView.dequeueReusableCell(withIdentifier: CheckBoxTableViewCell.reuseIdentifier, for: indexPath) as! CheckBoxTableViewCell
            
            let checkBoxData = menuCheckBoxDataArray[indexPath.section-2]
            
            let menuItem = checkBoxData.menu[indexPath.row]
            checkBoxTableViewCell.selectionStyle = .none
            
            checkBoxTableViewCell.configure(menu: menuItem.menu, price: menuItem.price, checkBoxSelected: menuItem.checkBoxSelected, sectionNum: menuItem.sectionNum)
            checkBoxTableViewCell.menuCheckBoxDataArray = menuCheckBoxDataArray
            
            
            return checkBoxTableViewCell
            
            
        }
        
    }
}
