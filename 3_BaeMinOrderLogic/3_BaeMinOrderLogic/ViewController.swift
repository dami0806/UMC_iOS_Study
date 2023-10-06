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
    var menuRadioDataArray: [MenuRadioBoxSection] = []
    
    let menuCheckBoxDataManager = MenuCheckBoxDataManager()
    var menuCheckBoxDataArray: [MenuCheckBoxSection] = []
    //
    var selectedIndex: Int = 0
    
    var selectedCheckBoxData: [MenuCheckBox] = []
    
    private lazy var uiimage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "피자")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.tag = 1
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
    

    private let bottomGetView : BottomGetView = {
        let view = BottomGetView()
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 0.3
        return view
    }()
    //네비게이션 상위 버튼들
    // MARK: - View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        resetCheckBoxes()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cellgray
        setupUI()
        setupRx()
        fetchData()
        scrollView.delegate = self
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        // super.viewDidAppear(animated)
        
        // 화면에 나타날 때마다 테이블 뷰의 높이를 업데이트
        updateTableViewHeight()
    }
    
    private func setupUI(){
        addSubviews()
        settingNaviItem()
    }
    private func setupRx() {
        // 연결
        TotalPriceManager.shared._totalPrice
            .map { "\( numberWithComma($0))원 담기" }
            .bind(to: bottomGetView.getLabel.rx.text)
            .disposed(by: disposeBag)
        
        //바텀뷰 눌렀을때
        let getCartGestureRecognizer = UITapGestureRecognizer()
        bottomGetView.view.addGestureRecognizer(getCartGestureRecognizer)
        
        getCartGestureRecognizer.rx.event
            .subscribe(onNext: { [weak self] gestureRecognizer in
                self?.getCartTapped()
                TotalPriceManager.shared.totalCountArray.append(TotalPriceManager.shared.totalCount)
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
        tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.reuseIdentifier)
    }
    
    private func addSubviews() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(uiimage)
        scrollView.addSubview(contentView)
        
        view.bringSubviewToFront(bottomView)
        
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
        uiimage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(bottomView.snp.top)
        }
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(500)
            
        }
        bottomGetView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(view.snp.width).multipliedBy(0.25)
            
            
        }
    }
    //데이터 섹션안에있는 모든행가져와서 개수가져오기
    func getTotalcheckNumberOfCells() -> Int {
        var total = 0
        for section in menuCheckBoxDataArray{
            total += section.menu.count
        }
        return total
    }
    private func calculateTableViewHeight() -> CGFloat {
        
        let radioNumberOfCells = menuRadioDataArray.count
        let checkNumberOfCells =  getTotalcheckNumberOfCells()
        let headernumberOfCells = headerDataArray.count
        
        let cellHeight: CGFloat = view.frame.width*0.1
        let headerCellHeight: CGFloat = view.frame.width*0.25
        let totalHeight = CGFloat(headernumberOfCells+1)*headerCellHeight + CGFloat(radioNumberOfCells+checkNumberOfCells) * cellHeight + view.frame.width * 0.85 + CGFloat(headernumberOfCells+1)*10
        
        return totalHeight
    }
    // 테이블뷰 높이를 계산하고 업데이트하는 메서드
    private func updateTableViewHeight() {
        let newHeight = calculateTableViewHeight()
        tableView.snp.updateConstraints { make in
            make.height.equalTo(newHeight)
        }
        scrollView.layoutIfNeeded()
        
    }
    
    private func settingNaviItem(){
        navigationController?.navigationBar.tintColor = .black
        
        let backBtn = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(buttonTapped))
        let homeBtn = UIBarButtonItem(image: UIImage(systemName: "house"), style: .plain, target: self, action: #selector(buttonTapped))
        let shareBtn = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(buttonTapped))

        let cartButtonView = UIView()
        cartButtonView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        let cartButton = UIButton(type: .custom)
        cartButton.frame = CGRect(x: 0, y: 2, width: 30, height: 30)
        cartButton.setImage(UIImage(systemName: "cart"), for: .normal)
        cartButton.addTarget(self, action: #selector(cartBtnTapped), for: .touchUpInside)
        
        // 숫자를 표시
        let cartCountLabel = UILabel()
        cartCountLabel.frame = CGRect(x: 20, y: 0, width: 15, height: 15)
        cartCountLabel.backgroundColor = .systemPink
        cartCountLabel.textColor = .white
        cartCountLabel.textAlignment = .center
        cartCountLabel.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        cartCountLabel.layer.cornerRadius = 7.5
        cartCountLabel.layer.masksToBounds = true
        cartCountLabel.text = "\(cartCount)" // 초기 숫자 설정
        cartCountLabel.isHidden = true
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
           
                cartButtonView.isHidden = false
                cartCountLabel.isHidden = false
            
        }
        TotalPriceManager.shared.selectedMenuArray.append(TotalPriceManager.shared.selectedMenuItems)
        TotalPriceManager.shared.totalPriceArray.append(TotalPriceManager.shared.totalPrice*TotalPriceManager.shared.totalCount)
        TotalPriceManager.shared.sectionCountArray.append(TotalPriceManager.shared.totalCount)
        
    }
    @objc func cartBtnTapped(){
        let myCartViewController = MyCartViewController()
        myCartViewController.selectedItems = selectedCheckBoxData
        self.navigationController?.pushViewController(myCartViewController, animated: true)
        
    }
    
    @objc func buttonTapped(){
        
    }
    func resetCheckBoxes() {
        // 메뉴 라디오 버튼 초기화
        for (sectionIndex, var sectionData) in menuRadioDataArray.enumerated() {
            for (rowIndex, var item) in sectionData.menu.enumerated() {
                item.checkBoxSelected = (sectionIndex == 0 && rowIndex == 0) // 첫 번째 라디오 버튼은 선택 상태로 초기화
                sectionData.menu[rowIndex] = item
            }
            menuRadioDataArray[sectionIndex] = sectionData
        }
        
        // 메뉴 체크박스 초기화
        for (sectionIndex, var sectionData) in menuCheckBoxDataArray.enumerated() {
            for (rowIndex, var item) in sectionData.menu.enumerated() {
                item.checkBoxSelected = false
                sectionData.menu[rowIndex] = item
                
            }
            menuCheckBoxDataArray[sectionIndex] = sectionData
        }
        
        // 선택된 아이템 및 가격 초기화
        selectedCheckBoxData.removeAll()
        TotalPriceManager.shared.totalPrice = 0
        TotalPriceManager.shared.totalCount = 1
        TotalPriceManager.shared.selectedMenuItems.removeAll()
        
        // 선택된 라디오 버튼 인덱스 초기화
        selectedIndex = 0
    
        
        // 라디오 버튼과 체크박스 UI 업데이트
           for section in 0..<menuRadioDataArray.count {
               let indexPath = IndexPath(row: section, section: 0)
            
               if let cell = tableView.cellForRow(at: indexPath) as? RadioBoxTableViewCell {
                   if indexPath.row == 0 {
                      cell.checkButtonView.backgroundColor = UIColor.logoColor
                   }
                   else{
                       cell.checkButtonView.backgroundColor = .white
                   }
               }
           }
        // 체크박스 UI 업데이트
         for section in 0..<menuCheckBoxDataArray.count {
             for row in 0..<menuCheckBoxDataArray[section].menu.count {
                 let indexPath = IndexPath(row: row, section: section + 1)
                 if let cell = tableView.cellForRow(at: indexPath) as? CheckBoxTableViewCell {
                     cell.checkButtonView.backgroundColor = .white
                 }
             }
         }
        tableView.reloadData()
            // 테이블 뷰 높이 업데이트
            updateTableViewHeight()
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
        if section != 0 {
            
            headerView.configure(headerTitle: headerData.headerTitle, subTitle: headerData.subTitle, selectImage: headerData.selectImage)
            return headerView
            
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        if section == headerDataArray.count-1 {
            return 80
        }
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else if section == 1 {
            return menuRadioDataArray[section-1].menu.count
        }
        else if section == headerDataArray.count-1{
            return 0
        }
        else{
            
            return menuCheckBoxDataArray[section-2].menu.count
            
        }
        
    }
    //섹션사이 간격
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        //        if section == headerDataArray.count - 1 {
        //            // 마지막 섹션에 표시할 푸터 뷰를 생성하고 반환
        let footerView = UIView()
        footerView.backgroundColor = UIColor.cellgray
        return footerView
        
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == headerDataArray.count - 1 {
            return 10.0
        } else {
            return 10
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 첫 번째 섹션(인덱스 0)은 라디오 버튼 데이터로 설정
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.reuseIdentifier, for: indexPath) as! TitleTableViewCell
            cell.selectionStyle = .none
            return cell
            
        } else if indexPath.section == 1 {
            let radioTableViewCell = tableView.dequeueReusableCell(withIdentifier: RadioBoxTableViewCell.reuseIdentifier, for: indexPath) as! RadioBoxTableViewCell
            radioTableViewCell.selectionStyle = .none

            let radioData = menuRadioDataArray[indexPath.section-1]
            let radioItem = radioData.menu[indexPath.row]
            radioTableViewCell.configure(menu: radioItem.menu, price: radioItem.price, checkBoxSelected: radioItem.checkBoxSelected, sectionNum:radioItem.sectionNum)
            radioTableViewCell.menuRadioDataArray = menuRadioDataArray

            if indexPath.row == selectedIndex {
                radioTableViewCell.checkUIView.backgroundColor = UIColor.logoColor
            }
            else {
              radioTableViewCell.checkUIView.backgroundColor = .white
            }
            radioTableViewCell.checkButtonView.tag = indexPath.row
            radioTableViewCell.checkButtonView.addTarget(self, action: #selector(RdoButtonTapped), for: .touchUpInside)
      
        radioTableViewCell.selectionStyle = .none
        return radioTableViewCell
        
    } else {
        // 섹션 2부터 이후의 셀은 체크박스로
        let checkBoxTableViewCell = tableView.dequeueReusableCell(withIdentifier: CheckBoxTableViewCell.reuseIdentifier, for: indexPath) as! CheckBoxTableViewCell
        checkBoxTableViewCell.selectionStyle = .none

        let checkBoxData = menuCheckBoxDataArray[indexPath.section-2]
        
        let menuItem = checkBoxData.menu[indexPath.row]
        checkBoxTableViewCell.selectionStyle = .none
        
        checkBoxTableViewCell.configure(menu: menuItem.menu, price: menuItem.price, checkBoxSelected: menuItem.checkBoxSelected, sectionNum: menuItem.sectionNum)
        checkBoxTableViewCell.menuCheckBoxDataArray = menuCheckBoxDataArray
        return checkBoxTableViewCell
        
        
    }
    
}
    @objc func RdoButtonTapped(_ sender: UIButton) {
        print("🥲")
        if sender.tag != selectedIndex {
            let previousIndexPath = IndexPath(row: selectedIndex, section: 1)
            selectedIndex = sender.tag
            if let previousCell = tableView.cellForRow(at: previousIndexPath) as? RadioBoxTableViewCell {
                previousCell.checkButtonView.backgroundColor = .white
            }
           sender.backgroundColor = UIColor.logoColor
        }
    }
}
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.tag == 1{
            if scrollView.contentOffset.y < -97 {
                // contentOffset.y 값이 0보다 작아질 때 실행할 코드
                uiimage.snp.remakeConstraints { make in
                    make.top.equalTo(view.snp.top)
                    make.centerX.equalTo(view.snp.centerX)
                    make.bottom.equalTo(bottomView.snp.top)
                    make.width.equalTo(uiimage.snp.height).multipliedBy(1.5)
                }
            }else {
                uiimage.snp.remakeConstraints { make in
                    make.top.leading.trailing.equalToSuperview()
                    make.bottom.equalTo(bottomView.snp.top)
                }
            }
            
        }
        
        
    }
}
