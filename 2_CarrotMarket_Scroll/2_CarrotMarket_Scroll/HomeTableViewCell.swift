//
//  HomeTableViewCell.swift
//  2_CarrotMarket_Scroll
//
//  Created by 박다미 on 2023/09/26.
//

import Foundation
import UIKit
import SnapKit

class HomeTableViewCell : UITableViewCell {
    static let reuseIdentifier = "HomeTableViewCell"
    
    //데이터 정보들
    
    lazy var goodsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var goodsTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    
    
    
    lazy var goodsPrice: UILabel = {
        let label = UILabel()
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
        contentView.addSubview(goodsImage)
        contentView.addSubview(goodsTitle)
        contentView.addSubview(locationLabel)
        contentView.addSubview(goodsPrice)
        
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        goodsImage.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(10)
            make.width.equalTo(goodsImage.snp.height)
        }
        goodsTitle.snp.makeConstraints { make in
            make.leading.equalTo(goodsImage.snp.trailing).offset(10)
            make.top.trailing.equalToSuperview().inset(10)
        }
        locationLabel.snp.makeConstraints { make in
            make.leading.equalTo(goodsImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(goodsTitle.snp.bottom).offset(10)
        }
        goodsPrice.snp.makeConstraints { make in
            make.leading.equalTo(goodsImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(locationLabel.snp.bottom).offset(10)
        }
        
    }
}

//광고성 테이블뷰 셀
class HomeAdTableViewCell : UITableViewCell {
    static let reuseIdentifier = "HomeAdTableViewCell"
    let homeCellDataManager = HomeCellDataManager()
    var homeGoodsDataArray: [Goods] = []
    
    lazy var adLabel: UILabel = {
        let label = UILabel()
        label.text = "우리동네 한가위 선물세트"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    lazy var adimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "달")
        
        return imageView
    }()
    lazy var adbutton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        homeCellDataManager.makeHomeAdData()
        homeGoodsDataArray = homeCellDataManager.gethomeGoodsDataArrayCellData()
        
        addSubviews()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        collectionView.register(HomeAdCollectionViewCell.self, forCellWithReuseIdentifier: HomeAdCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func addSubviews() {
        contentView.addSubview(adLabel)
        contentView.addSubview(adimageView)
        contentView.addSubview(adbutton)

        contentView.addSubview(collectionView)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        adLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.leading.equalToSuperview().inset(10)
        }
        adimageView.snp.makeConstraints { make in
            make.leading.equalTo(adLabel.snp.trailing).offset(3)
            make.centerY.equalTo(adLabel.snp.centerY)
            make.height.width.equalTo(contentView.snp.width).multipliedBy(0.08)
        }
        adbutton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalTo(adLabel.snp.centerY)
            make.height.width.equalTo(contentView.snp.width).multipliedBy(0.08)

        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(adLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(30)
            
        }
    }
}

extension HomeAdTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeGoodsDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeAdCollectionViewCell.reuseIdentifier, for: indexPath) as! HomeAdCollectionViewCell
        
        cell.goodsImage.image = homeGoodsDataArray[indexPath.row].goodsImage
        cell.goodsPrice.text = homeGoodsDataArray[indexPath.row].goodsPrice
        cell.goodsTitle.text =  homeGoodsDataArray[indexPath.row].goodsTitle
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            
        return CGSize(width: contentView.frame.width*0.3, height: contentView.frame.width*0.5)
        }
    
}
