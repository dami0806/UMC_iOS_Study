//
//  TableViewCell.swift
//  1_BeaMin_Layout
//
//  Created by 박다미 on 2023/09/19.
//

import UIKit
import SnapKit
//MARK: - HeaderView
class ShopTableHeaderView: UITableViewHeaderFooterView{
    private let titleLabel = UILabel()
    private let imageView = UIImageView()
    private let button = UIButton()
    

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // 타이틀 레이블 설정
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 19)
        contentView.addSubview(titleLabel)
        //이미지 설정
        contentView.addSubview(imageView)
        // 버튼 설정
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
     

        button.tintColor = .black
        contentView.addSubview(button)
        

        
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        imageView.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).offset(5)
            make.height.width.equalTo(titleLabel.snp.height)
            make.centerY.equalToSuperview()

        }
        button.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
    }
    
    func configure(title: String,image: UIImage) {
        titleLabel.text = title
        imageView.image = image
    }
}

//MARK: -ShopAllProductsTableViewCell
class ShopAllProductsTableViewCell: UITableViewCell {
    private let collectionView: UICollectionView
    let shopDataManager = ShopDataManager()
    var shopDataArray: [ShopSection] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.reloadData()
        setupViews()
        setupConstraints()
        shopDataManager.makeShopData()
        shopDataArray = shopDataManager.getShopData()
        backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ShopAllProductCollectionViewCell.self, forCellWithReuseIdentifier: "ShopAllProductCollectionViewCell")
        contentView.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            //make.edges.equalToSuperview()
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(contentView.snp.width).multipliedBy(0.3)
        }

        
        
    }
    
    
}
extension  ShopAllProductsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopDataArray[1].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopAllProductCollectionViewCell", for: indexPath) as! ShopAllProductCollectionViewCell
        let image = shopDataArray[1].items[indexPath.item].image
        let label = shopDataArray[1].items[indexPath.item].text
        cell.imageView.image = image
        cell.label.text = label
        return cell
    }
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width * 0.27, height: collectionView.bounds.height)
    }
    
}


//MARK: -ShopMobileGiftsProductsTableViewCell
class ShopMobileGiftsTableViewCell: UITableViewCell {
    let shopDataManager = ShopDataManager()
    var shopDataArray: [ShopSection] = []
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ShopMobileGiftsCollectionViewCell.self, forCellWithReuseIdentifier: "ShopMobileGiftsCollectionViewCell")
        addSubview(collectionView)
        shopDataManager.makeShopData()
        shopDataArray = shopDataManager.getShopData()
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
extension ShopMobileGiftsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopDataArray[2].items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopMobileGiftsCollectionViewCell", for: indexPath) as! ShopMobileGiftsCollectionViewCell
        let image = shopDataArray[2].items[indexPath.item].image
        cell.imageView.image = image
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 2.5, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

//MARK: -ShopBestItemsTableViewCell
class ShopBestItemsTableViewCell: UITableViewCell {
    
    private let collectionView: UICollectionView
    let shopDataManager = ShopDataManager()
    var shopDataArray: [ShopSection] = []
    let numberOfPages = 2
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = 0
        
        return pageControl
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.isPagingEnabled = true
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.reloadData()
        setupViews()
        setupConstraints()
        shopDataManager.makeShopData()
        shopDataArray = shopDataManager.getShopData()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ShopBestItemsCollectionViewCell.self, forCellWithReuseIdentifier: "ShopBestItemsCollectionViewCell")
        contentView.addSubview(collectionView)
        contentView.addSubview(pageControl)
        
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(10)
            make.height.equalTo(collectionView.snp.width).multipliedBy(1.2)}
        
        pageControl.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
            make.top.equalTo(collectionView.snp.bottom).offset(10)
        }
        
    }
    
    
}
extension ShopBestItemsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopDataArray[3].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopBestItemsCollectionViewCell", for: indexPath) as! ShopBestItemsCollectionViewCell
        let image = shopDataArray[3].items[indexPath.item].image
        let label = shopDataArray[3].items[indexPath.item].text
        cell.imageView.image = image
        cell.label.text = label
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth = (collectionView.bounds.width - 30) * 0.5 // 셀 너비를 화면의 1/4로 설정하고 좌우 여백인 10을 제외한 크기로 계산
        let itemHeight = (collectionView.bounds.height - 10) * 0.5
        return CGSize(width: itemWidth, height: itemHeight)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let currentPage = Int(scrollView.contentOffset.x / (scrollView.frame.width-10))
        pageControl.currentPage = currentPage
    }
    
    
}
//MARK: - ShopNewProductsTableViewCell

class ShopNewProductsTableViewCell: UITableViewCell {
    
    let collectionView: UICollectionView
    let shopDataManager = ShopDataManager()
    var shopDataArray: [ShopSection] = []
    let numberOfPages = 2
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = 0
        return pageControl
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.isPagingEnabled = true
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.reloadData()
        setupViews()
        setupConstraints()
        shopDataManager.makeShopData()
        shopDataArray = shopDataManager.getShopData()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ShopBestItemsCollectionViewCell.self, forCellWithReuseIdentifier: "ShopBestItemsCollectionViewCell")
        contentView.addSubview(collectionView)
        contentView.addSubview(pageControl)
        
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(10)
            make.height.equalTo(contentView.snp.width).multipliedBy(1.2)}
        pageControl.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
            make.top.equalTo(collectionView.snp.bottom).offset(10)
        }
        
    }
    
    
}
extension  ShopNewProductsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopDataArray[4].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopBestItemsCollectionViewCell", for: indexPath) as! ShopBestItemsCollectionViewCell
        let image = shopDataArray[4].items[indexPath.item].image
        let label = shopDataArray[4].items[indexPath.item].text
        cell.imageView.image = image
        cell.label.text = label
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth = (collectionView.bounds.width - 30) * 0.5 // 셀 너비를 화면의 1/4로 설정하고 좌우 여백인 10을 제외한 크기로 계산
        let itemHeight = (collectionView.bounds.height - 10) * 0.5
        return CGSize(width: itemWidth, height: itemHeight)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollView1: \(scrollView.contentOffset.x)")
        print("scrollView2: \(scrollView.frame.width)")
        let currentPage = Int(scrollView.contentOffset.x / (scrollView.frame.width-10))
        pageControl.currentPage = currentPage
    }
    
    
}



