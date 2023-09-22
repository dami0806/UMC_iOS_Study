//
//  SecondCustomView.swift
//  1_BeaMin_Layout
//
//  Created by 박다미 on 2023/09/19.
//

import Foundation
import UIKit
import SnapKit

class SecondCustomView: UIView {
    let dataManager = SecondCellDataManager()
    var secondItemArray: [ShopItem] = []
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "알뜰 한집배달"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
        
    }()
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "원하는 대로 골라 주문!"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.textColor = .darkGray
        return label
        
    }()
    
    private lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "배민1")
        return imageView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(nil, for: .normal)
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = .darkGray
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
    
    @objc private func buttonTapped() {
        // 버튼이 탭되었을 때의 동작 처리
    }
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(SecondCustomCollectionCell.self, forCellWithReuseIdentifier:SecondCustomCollectionCell.reuseIdentifier)
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.backgroundColor = .white
        super.layer.cornerRadius = 8
        super.layer.masksToBounds = true
        
        dataManager.makesecondData()
        secondItemArray = dataManager.getSecondCellData()
        
        
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    private func addSubview(){
        addSubview(titleLabel)
        addSubview(imageView)
        
        addSubview(subtitleLabel)
        addSubview(button)
        addSubview(collectionView)
        
        configureConstraints()
        
        
    }
    private func configureConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(8)
        }
        imageView.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).offset(3)
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.width.equalTo(super.snp.width).multipliedBy(0.08)
            make.height.equalTo(imageView.snp.width).multipliedBy(0.5)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(3)
            make.centerY.equalTo(titleLabel.snp.centerY)
        }
        button.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(8)
            make.height.width.equalTo(super.snp.width).multipliedBy(0.15)
            
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        
    }
    
}
extension SecondCustomView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return secondItemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondCustomCollectionCell.reuseIdentifier, for: indexPath) as? SecondCustomCollectionCell else {
            return UICollectionViewCell()
        }
        
        let shopItem = secondItemArray[indexPath.item]
        cell.configure(image: shopItem.image!, title: shopItem.text)
        
        return cell
    }
    //세로
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           
           let itemWidth = collectionView.bounds.width / 5 - (5*2)
           let itemHeight: CGFloat = itemWidth

           return CGSize(width: itemWidth, height: itemHeight)
       }

}
