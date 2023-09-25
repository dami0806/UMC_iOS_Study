//
//  HomeViewController.swift
//  2_CarrotMarket
//
//  Created by 박다미 on 2023/09/25.
//

import Foundation
import UIKit
import SnapKit

class HomeViewController: UIViewController {
    // let tabbarController = TabbarController()
    //1.navigation 인천논현동 네비버튼
    //2.전체 스크롤뷰
    //3.테이블뷰
    //4.콜렉션뷰
    let homeCellDataManager = HomeCellDataManager()
    var homeGoodsDataArray: [Goods] = []

//    lazy var collectionView: UICollectionView = {
//            let layout = UICollectionViewFlowLayout()
//            layout.scrollDirection = .horizontal
//            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//            collectionView.showsHorizontalScrollIndicator = false
//            collectionView.delegate = self
//            collectionView.dataSource = self
//            return collectionView
//        }()
   
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier)
        homeCellDataManager.makeHomeData()
        homeGoodsDataArray = homeCellDataManager.gethomeGoodsDataArrayCellData()
        settingNaviItem()
        addSubviews()
        
    }
    //MARK: - addSubviews()
    private func addSubviews() {
        view.addSubview(tableView)
       
        
        configureConstraints()
    }
    //MARK: - configureConstraints()
    private func configureConstraints() {
    
        tableView.snp.makeConstraints { make in
                    make.edges.equalToSuperview()
                }
        
    

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
extension HomeViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeGoodsDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseIdentifier, for: indexPath) as! HomeTableViewCell
        cell.goodsImage.image = homeGoodsDataArray[indexPath.row].goodsImage
        cell.goodsTitle.text = homeGoodsDataArray[indexPath.row].goodsTitle
        cell.locationLabel.text = homeGoodsDataArray[indexPath.row].locationLabel
        cell.reservationImage.image = homeGoodsDataArray[indexPath.row].reservationImage
        cell.goodsPrice.text = homeGoodsDataArray[indexPath.row].goodsPrice
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.width*0.3
    }
}

