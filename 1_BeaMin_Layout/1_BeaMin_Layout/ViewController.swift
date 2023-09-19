//
//  ViewController.swift
//  1_BeaMin_Layout
//
//  Created by 박다미 on 2023/09/19.
//

import UIKit
import SnapKit


final class ViewController: UIViewController {
    let dataManager = ShopDataManager()
    var shopsDataArray: [ShopSection] = []
    
    let customTabBarController = CustomTabBarController()
    private lazy var shopTableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.interSpaceColor
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    let searchBar = UISearchBar()
    
    private lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    private lazy var midView: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        return view
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    //customView1 3개를 stackview로묶기
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 6
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private lazy var customView1: FirstCustomView = {
        let view = FirstCustomView()
        view.configure(title: "배달", subtitle: "세상은 넓고\n맛집은 많다", image: UIImage(named: "맨위1"))
        return view
    }()
    private lazy var customView2: FirstCustomView = {
        let view = FirstCustomView()
        view.configure(title: "B마트", subtitle: "장보기도\n더빠르게!", image: UIImage(named: "맨위2"))
        return view
    }()
    private lazy var customView3: FirstCustomView = {
        let view = FirstCustomView()
        view.configure(title: "배민스토어", subtitle: "홈플익스프레스\n신선 장보기", image: UIImage(named: "맨위3"))
        return view
    }()
    
    //customView2
    private lazy var customItemView = SecondCustomView()
    private var secondCustomviewHeight: CGFloat = 0.0
    //banners
    
    //image로 넣고 그안에 셀 넣기
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        dataManager.makeShopData()
        shopsDataArray = dataManager.getShopData()
        setupViews()
        addSubviews()
        settingNaviItem()
        
        //탭바 맨위로
        view.bringSubviewToFront(customTabBarController.view)

    }

    private func setupViews(){
        shopTableView.dataSource = self
        shopTableView.delegate = self
        //  shopTableView.register(ShopAddTableViewCell.self, forCellReuseIdentifier: "ShopAddTableViewCell")
        shopTableView.register(ShopAllProductsTableViewCell.self, forCellReuseIdentifier: "ShopAllProductsTableViewCell")
        shopTableView.register(ShopMobileGiftsTableViewCell.self, forCellReuseIdentifier: "ShopMobileGiftsTableViewCell")
        //shopTableView.register(ShopBestItemsTableViewCell.self, forCellReuseIdentifier: "ShopBestItemsTableViewCell")
        //shopTableView.register(ShopNewProductsTableViewCell.self, forCellReuseIdentifier: "ShopNewProductsTableViewCell")
        
        shopTableView.register(ShopTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "ShopTableHeaderView")
        
        
        midView.addSubview(shopTableView)
    }
    
    
    
    private func settingNaviItem(){
        let placeText = UIBarButtonItem(title: "남동구 소래역로 93", style: .plain, target: self, action: #selector(buttonTapped))
        // 네비게이션 바 오른쪽 상단에 버튼 3개 추가
        let button1 = UIBarButtonItem(title: "버튼1", style: .plain, target: self, action: #selector(buttonTapped))
        let button2 = UIBarButtonItem(title: "버튼2", style: .plain, target: self, action: #selector(buttonTapped))
        let button3 = UIBarButtonItem(title: "버튼3", style: .plain, target: self, action: #selector(buttonTapped))
        
        // 버튼 색상 설정
        button1.tintColor = .blue
        button2.tintColor = .blue
        button3.tintColor = .blue
        navigationItem.rightBarButtonItems = [button1, button2, button3]
        navigationItem.leftBarButtonItem = placeText
    }
    
    @objc func buttonTapped() {
        //버튼탭 실행
    }
    
    
    private func addSubviews() {
        
        addChild(customTabBarController)
        view.addSubview(customTabBarController.view)
        customTabBarController.didMove(toParent: self)
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        contentView.addSubview(topView)
        contentView.addSubview(midView)
        topView.addSubview(searchBar)
        
        contentView.addSubview(bottomView)
        
        stackView.addArrangedSubview(customView1)
        stackView.addArrangedSubview(customView2)
        stackView.addArrangedSubview(customView3)
        
        
        topView.addSubview(stackView)
        topView.addSubview(customItemView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        
        customTabBarController.view.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(customTabBarController.tabBar.snp.top)
        }
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(bottomView.snp.bottom)
        }
        searchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(10)
            
        }
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(500)
        }
        
        midView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(2000)
        }
        bottomView.snp.makeConstraints { make in
            make.top.equalTo(midView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(500)
        }
        shopTableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(bottomView.snp.bottom)
            
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(stackView.snp.width).multipliedBy(0.35)
        }
        customView1.snp.makeConstraints { make in
            make.height.width.equalTo(stackView.snp.width).multipliedBy(0.3)
        }
        customView2.snp.makeConstraints { make in
            make.height.width.equalTo(stackView.snp.width).multipliedBy(0.3)
        }
        customView3.snp.makeConstraints { make in
            make.height.width.equalTo(stackView.snp.width).multipliedBy(0.3)
        }
        
        customItemView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(customItemView.snp.width).multipliedBy(0.55)
        }
    }
    
    
}
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //우리동네 빠른배달
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShopAllProductsTableViewCell", for: indexPath) as! ShopAllProductsTableViewCell
            return cell
            //최근에 주문했어요
        } else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShopAllProductsTableViewCell", for: indexPath) as! ShopAllProductsTableViewCell
            return cell
        }
        //오늘의 할인
        else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShopMobileGiftsTableViewCell", for: indexPath) as! ShopMobileGiftsTableViewCell
            return cell
        }
        //B마트 장보기 특가
        else if indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShopAllProductsTableViewCell", for: indexPath) as! ShopAllProductsTableViewCell
            return cell
        }
        //마음을 선물해보세요
        if indexPath.section == 4 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShopAllProductsTableViewCell", for: indexPath) as! ShopAllProductsTableViewCell
            return cell
        }
        //전국의 별미가 한가득
        else if indexPath.section == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShopAllProductsTableViewCell", for: indexPath) as! ShopAllProductsTableViewCell
            return cell
        }
        //이런일도 한답니다
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShopAllProductsTableViewCell", for: indexPath) as! ShopAllProductsTableViewCell
            return cell
        }
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return shopsDataArray.count
    }
    ///헤더 높이
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    ///헤더
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ShopTableHeaderView") as! ShopTableHeaderView
        let sectionData = shopsDataArray[section]
        let title = sectionData.headerTitle ?? ""
        let images = sectionData.headerImage
        
        headerView.configure(title: title ,image: images)
        
        
        return headerView
    }
    
    
    private func handleButtonTap(section: Int) {
        print("Button tapped for section \(section)")
    }
    
    
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        // 섹션 간의 간격을 조절하기 위한 빈 뷰
        let spacingView = UIView()
        spacingView.backgroundColor = UIColor.yellow // 빈 뷰의 배경색을 테이블 뷰의 배경색과 동일하게 설정
        
        // 빈 뷰의 높이를 조절하여 원하는 간격 크기로 설정
        spacingView.snp.makeConstraints { make in
            make.height.equalTo(20.0) // 원하는 간격 크기로 조절
        }
        
        return spacingView
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        // 각 섹션의 하단 공백 높이 설정 (간격 크기)
        return 50.0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return tableView.bounds.width * 0.3
        }
        else if indexPath.section == 1 {
            return tableView.bounds.width * 0.253
        }
        else if indexPath.section == 2 {
            return tableView.bounds.width * 0.15
        }
        if indexPath.section == 4 {
            return tableView.bounds.width * 0.3
        }
        else if indexPath.section == 5 {
            return tableView.bounds.width * 0.253
        }
        else if indexPath.section == 6 {
            return tableView.bounds.width * 0.15
        }
        else {
            return tableView.bounds.width * 0.3
        }
    }
}
