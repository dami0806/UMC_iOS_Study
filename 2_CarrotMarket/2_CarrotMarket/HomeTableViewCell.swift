//
//  HomeTableViewCell.swift
//  2_CarrotMarket
//
//  Created by 박다미 on 2023/09/25.
//

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



class HomeCategoryTableViewCell : UITableViewCell {
    
    static let reuseIdentifier = "HomeCategoryTableViewCell"
    let homeCategoryDataManager = HomeCategoryDataManager()
    var homeCagetoryDataArray: [Category] = []
    //카테고리
    
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
        homeCategoryDataManager.makeHomeCategoryData()
        homeCagetoryDataArray = homeCategoryDataManager.gethomeCagegoryDataArrayCellData()
        addSubviews()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        collectionView.register(HomeCategoryCollectionViewCell.self, forCellWithReuseIdentifier: HomeCategoryCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func addSubviews() {
        
        contentView.addSubview(collectionView)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
    }
}

extension HomeCategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
            print("asdf")
            let cellHeight: CGFloat = collectionView.frame.height
            
            return CGSize(width: cellHeight, height: cellHeight)
        }
        else{
            let cellPadding: CGFloat = 10// 원하는 패딩 값 설정
            
            
            let text = homeCagetoryDataArray[indexPath.row].text
            
            // 라벨 폰트를 설정
            let font = UIFont.systemFont(ofSize: 12, weight: .regular)
            
            // 라벨의 예상 크기를 계산
            let labelSize = (text as NSString).size(withAttributes: [
                NSAttributedString.Key.font: font
            ])
            
            let cellWidth = labelSize.width*2 + 2 * cellPadding
            let cellHeight: CGFloat = collectionView.frame.height
            
            return CGSize(width: cellWidth, height: cellHeight)
        }
        
        
    }
    
    
}
