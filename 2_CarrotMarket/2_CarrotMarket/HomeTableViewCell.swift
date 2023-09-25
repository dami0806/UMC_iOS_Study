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
    let homeCategoryDataManager = HomeCategoryDataManager()
    var homeCagetoryDataArray: [Category] = []
    //카테고리
    
   lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
  
    
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
    //나눔이거나 예약일때의 이미지 + 가격
   lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 3
        return stackView
    }()
    lazy var reservationImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    lazy var goodsPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
        collectionView.reloadData()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
private func setupCollectionView(){
    collectionView.delegate = self
    collectionView.dataSource = self
    homeCategoryDataManager.makeHomeCategoryData()
    homeCagetoryDataArray = homeCategoryDataManager.gethomeCagegoryDataArrayCellData()
    collectionView.register(HomeCategoryCollectionViewCell.self, forCellWithReuseIdentifier: HomeCategoryCollectionViewCell.reuseIdentifier)
    

    
}
    private func addSubView() {
        contentView.addSubview(goodsImage)
        contentView.addSubview(goodsTitle)
        contentView.addSubview(locationLabel)
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(reservationImage)
        stackView.addArrangedSubview(goodsPrice)
        configureConstraints()
    }
    private func configureConstraints(){
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
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(goodsImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(locationLabel.snp.bottom).offset(10)
        }
        
    }
}
extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
        return homeCagetoryDataArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCategoryCollectionViewCell.reuseIdentifier, for: indexPath) as! HomeCategoryCollectionViewCell

        cell.imageView.image = homeCagetoryDataArray[indexPath.row].image
        cell.label.text = homeCagetoryDataArray[indexPath.row].text
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = contentView.bounds.width * 0.25
//        let height = contentView.bounds.height
//        return CGSize(width: width, height: height)
//    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
