//
//  ViewController.swift
//  3_BaeMinOrderLogic
//
//  Created by 박다미 on 2023/10/01.
//

import UIKit

class ViewController: UIViewController {
    let headerDataManager = HeaderDataManager()
    var headerDataArray: [Header] = []
    
    let menuRadioDataManager = MenuRadioDataManager()
    var menuRadioDataArray: [MenuRadio] = []
    
    let menuCheckBoxDataManager = MenuCheckBoxDataManager()
    var menuCheckBoxDataArray: [MenuCheckBoxSection] = []
    
    struct SectionData {
        var headerTitle: String
        var items: [String]
    }
    
    
    
    
    //이미지
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
    //테이블뷰
    private lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let bottomGetView = BottomGetView()
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        settingNaviItem()
        headerDataManager.makeHeaderData()
        headerDataArray = headerDataManager.getHeaderData()
        
        menuRadioDataManager.makeMenuRadioData()
        menuRadioDataArray = menuRadioDataManager.getMenuRadioData()
        
        menuCheckBoxDataManager.makeMenuCheckBoxData()
        menuCheckBoxDataArray = menuCheckBoxDataManager.getMenuCheckBoxData()
        
        tableView.register(CheckBoxTableViewCell.self, forCellReuseIdentifier: CheckBoxTableViewCell.reuseIdentifier)
        tableView.register(TableHeaderView.self, forHeaderFooterViewReuseIdentifier: TableHeaderView.reuseIdentifier)
        tableView.register(RadioBoxTableViewCell.self, forCellReuseIdentifier: RadioBoxTableViewCell.reuseIdentifier)
        
        view.bringSubviewToFront(bottomGetView)

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
            make.height.equalTo(2000)
            
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
        
        let cartBtn = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: #selector(buttonTapped))
        
        
        navigationController?.navigationBar.barTintColor = .white
        
        navigationItem.rightBarButtonItems = [cartBtn,shareBtn,homeBtn]
        navigationItem.leftBarButtonItem = backBtn
        
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
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableHeaderView.reuseIdentifier) as! TableHeaderView
        
        let headerData = headerDataArray[section]
        
        headerView.configure(headerTitle: headerData.headerTitle, subTitle: headerData.subTitle, selectImage: headerData.selectImage)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        else if section == 1 {
            return menuRadioDataArray.count
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

                  checkBoxTableViewCell.configure(menu: menuItem.menu, price: menuItem.price, checkBoxSelected: menuItem.checkBoxSelected)
                  return checkBoxTableViewCell
      

        }
        
    }
}
