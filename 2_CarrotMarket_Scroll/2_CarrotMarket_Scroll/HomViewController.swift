//
//  HomViewController.swift
//  2_CarrotMarket_Scroll
//
//  Created by 박다미 on 2023/09/26.
//

import Foundation
import UIKit
import SnapKit


///MARK: HomeViewController
class HomeViewController: UIViewController {
    
    let homeCellDataManager = HomeCellDataManager()
    var homeGoodsDataArray: [Goods] = []
    
    let homeCategoryDataManager = HomeCategoryDataManager()
    var homeCagetoryDataArray: [Category] = []
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    //콜렉션뷰가 들어갈 뷰
    private lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = true

        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    //테이블뷰가 들어갈 뷰
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        settingNaviItem()
        addSubviews()
        setTableView()
        setCollectionView()
        
        homeCellDataManager.makeHomeData()
        homeGoodsDataArray = homeCellDataManager.gethomeGoodsDataArrayCellData()
        homeCategoryDataManager.makeHomeCategoryData()
        homeCagetoryDataArray = homeCategoryDataManager.gethomeCagegoryDataArrayCellData()
    }

    //MARK: - addSubviews()
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(topView)
        contentView.addSubview(bottomView)
        topView.addSubview(categoryCollectionView)
        bottomView.addSubview(tableView)
        configureConstraints()
    
}
//MARK: - configureConstraints()
private func configureConstraints() {
    
    scrollView.snp.makeConstraints { make in
        make.edges.equalToSuperview()
    }
    
    contentView.snp.makeConstraints { make in
        make.edges.equalToSuperview()
        make.width.equalToSuperview()
        make.bottom.equalTo(bottomView.snp.bottom)
    }
    
    topView.snp.makeConstraints { make in
        make.top.leading.trailing.equalToSuperview()
        make.height.equalTo(view.snp.width).multipliedBy(0.15)
    }
    
    bottomView.snp.makeConstraints { make in
        make.top.equalTo(topView.snp.bottom)
        make.leading.trailing.equalToSuperview()
        make.bottom.equalTo(tableView.snp.bottom)
    }
    categoryCollectionView.snp.makeConstraints { make in
        make.edges.equalToSuperview()
    }
    tableView.snp.makeConstraints { make in
        make.top.leading.trailing.equalToSuperview()
        make.height.equalTo(1000)

    }

}
    private func calculateTableViewHeight() -> CGFloat {
        let tableHeight = tableView.contentSize.height
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: tableHeight + contentView.frame.height)
        
           let numberOfCells =  homeGoodsDataArray.count
           let cellHeight: CGFloat = view.frame.width*0.3
           let totalHeight = CGFloat(numberOfCells) * cellHeight
           return totalHeight
       }
    
    private func setCollectionView() {
        categoryCollectionView.register(HomeCategoryCollectionViewCell.self, forCellWithReuseIdentifier: HomeCategoryCollectionViewCell.reuseIdentifier)
        categoryCollectionView.backgroundColor = .clear
        categoryCollectionView.showsHorizontalScrollIndicator = false
    }
    
//테이블뷰 세팅
    func setTableView(){
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier)
        tableView.register(HomeAdTableViewCell.self, forCellReuseIdentifier: HomeAdTableViewCell.reuseIdentifier)
        
    }
    
    private func settingNaviItem(){
        let placeText = UIBarButtonItem(title: "도림동", style: .plain, target: self, action: #selector(buttonTapped))
        let bellButton = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(buttonTapped))
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(buttonTapped))
        placeText.tintColor = .black
        bellButton.tintColor = .black
        searchButton.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        
        navigationItem.rightBarButtonItems = [bellButton,searchButton]
        navigationItem.leftBarButtonItem = placeText
    }
    @objc func buttonTapped(){
        
    }
    
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeCagetoryDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCategoryCollectionViewCell.reuseIdentifier, for: indexPath) as! HomeCategoryCollectionViewCell
        print(homeCagetoryDataArray[indexPath.row].text)
        cell.imageView.image = homeCagetoryDataArray[indexPath.row].image
        cell.label.text = homeCagetoryDataArray[indexPath.row].text
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if (homeCagetoryDataArray[indexPath.row].text == "" ){
           
            let cellHeight: CGFloat = collectionView.frame.height * 0.85
            
            return CGSize(width: cellHeight, height: cellHeight)
        }
        else{
            let cellPadding: CGFloat = 15
            
            
            let text = homeCagetoryDataArray[indexPath.row].text
            
            // 라벨 폰트를 설정
            let font = UIFont.systemFont(ofSize: 12, weight: .regular)
            
            // 라벨의 예상 크기를 계산
            let labelSize = (text as NSString).size(withAttributes: [
                NSAttributedString.Key.font: font
            ])
            
            let cellWidth = labelSize.width*2 + 2 * cellPadding
            let cellHeight: CGFloat = collectionView.frame.height * 0.85
            
            return CGSize(width: cellWidth, height: cellHeight)
        }

    }

}

extension HomeViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return homeGoodsDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 6{
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeAdTableViewCell.reuseIdentifier, for: indexPath) as! HomeAdTableViewCell
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseIdentifier, for: indexPath) as! HomeTableViewCell
            cell.goodsImage.image = homeGoodsDataArray[indexPath.row].goodsImage
            cell.goodsTitle.text = homeGoodsDataArray[indexPath.row].goodsTitle
            cell.locationLabel.text = homeGoodsDataArray[indexPath.row].locationLabel
            cell.goodsPrice.text = homeGoodsDataArray[indexPath.row].goodsPrice
            
            return cell
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 6{
            return view.frame.width*0.8

        }else{
            return view.frame.width*0.3
        }
    }
    
    
}



