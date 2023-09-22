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
    static let reuseIdentifier = "ShopTableHeaderView"
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
            make.leading.equalTo(titleLabel.snp.trailing).offset(4.5)
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

//MARK: -FastdeliveryTableViewCell
class FastdeliveryTableViewCell: UITableViewCell {
    static let reuseIdentifier = "FastdeliveryTableViewCell"

    private let collectionView: UICollectionView
    
    let storeDataManager = StoreDataManager()
    var storeDataArray: [StoreSection] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.reloadData()
        setupViews()
        setupConstraints()

        storeDataManager.makeStoreData()
        storeDataArray = storeDataManager.getStoreData()
        
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
        collectionView.register(FastdeliveryCollectionViewCell.self, forCellWithReuseIdentifier: FastdeliveryCollectionViewCell.reuseIdentifier)
        contentView.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            //make.edges.equalToSuperview()
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview()
         //   make.height.equalTo(contentView.snp.width).multipliedBy(0.8)
        }

        
        
    }
    
    
}
extension FastdeliveryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeDataArray[1].items.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FastdeliveryCollectionViewCell.reuseIdentifier, for: indexPath) as! FastdeliveryCollectionViewCell
        let foodImageView = storeDataArray[1].items[indexPath.item].foodImageView
        let storeLabel = storeDataArray[1].items[indexPath.item].storeLabel
        let scoreLabel = storeDataArray[1].items[indexPath.item].scoreLabel
        let deliveryLabel = storeDataArray[1].items[indexPath.item].deliveryLabel
        let deliveryTextLabel = storeDataArray[1].items[indexPath.item].deliveryTextLabel
        let deliveryTipLabel = storeDataArray[1].items[indexPath.item].deliveryTipLabel
        let deliveryTipTextLabel = storeDataArray[1].items[indexPath.item].deliveryTipTextLabel
        let uiImageView = storeDataArray[1].items[indexPath.item].uiImageView

        cell.foodImageView.image = foodImageView
        cell.storeLabel.text = storeLabel
        cell.scoreLabel.text = scoreLabel
        cell.deliveryLabel.text = deliveryLabel
        cell.deliveryTextLabel.text = deliveryTextLabel
        cell.deliveryTipLabel.text = deliveryTipLabel
        cell.deliveryTipTextLabel.text = deliveryTipTextLabel
        return cell
    }
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: contentView.bounds.width * 0.4, height: contentView.bounds.height)
    }
    
}


//MARK: -SaleTableViewCell:오늘의 할인
class SaleTableViewCell: UITableViewCell {
    static let reuseIdentifier = "SaleTableViewCell"

    
    let shopDataManager = ShopDataManager()
    var shopDataArray: [ShopSection] = []
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false

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
        
        collectionView.register(SaleCollectionViewCell.self, forCellWithReuseIdentifier: SaleCollectionViewCell.reuseIdentifier)
        contentView.addSubview(collectionView)
        
        shopDataManager.makeShopData()
        shopDataArray = shopDataManager.getShopData()
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
extension SaleTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopDataArray[2].items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SaleCollectionViewCell.reuseIdentifier, for: indexPath) as! SaleCollectionViewCell
        let image = shopDataArray[2].items[indexPath.item].image
        
        cell.imageView.image = image
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = contentView.bounds.width * 0.7
        let height = contentView.bounds.height
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
//MARK: - MartShoppingTableViewCell :B마트 특가
class MartShoppingTableViewCell: UITableViewCell {
    static let reuseIdentifier = "MartShoppingTableViewCell"

    private var selectedCellIndexPath: IndexPath?

    let martShoppingDataManager = MarkShoppingDataManager()
    var martShoppingpDataArray: [MartShoppingSection] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    private lazy var martShoppingContentView = B_MartView()//커스터

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCollectionView()
        
        let initialIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: initialIndexPath, animated: false, scrollPosition: .top)
        collectionView(collectionView, didSelectItemAt: initialIndexPath)

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(MartShoppingCollectionViewCell.self, forCellWithReuseIdentifier: MartShoppingCollectionViewCell.reuseIdentifier)
        
        martShoppingDataManager.makeMartShoppingData()
        martShoppingpDataArray = martShoppingDataManager.getMartShoppingData()
        addSubviews()
        
    }
    private func addSubviews() {
        contentView.addSubview(collectionView)
        contentView.addSubview(martShoppingContentView)
        configureConstraints()
    }
    private func configureConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(collectionView.snp.width).multipliedBy(0.2)
        }
        martShoppingContentView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(3)
            make.leading.trailing.equalToSuperview().inset(10)
         //   make.bottom.equalToSuperview().inset(100)//.offset(collectionView.bounds.width*0.4 - 10)//multipliedBy(0.5)//(martShoppingContentView.snp.width).multipliedBy(0.6)

            
        }
    }

 
    
}
extension MartShoppingTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return martShoppingpDataArray[0].items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MartShoppingCollectionViewCell.reuseIdentifier, for: indexPath) as! MartShoppingCollectionViewCell
        let foodImageView = martShoppingpDataArray[0].items[indexPath.item].foodImageView

        
        cell.imageView.image = foodImageView
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = contentView.bounds.width * 0.2
        let height = width
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let contentViewWidth = contentView.bounds.width * 0.2 * 4 + 15+15
        
        return (contentView.bounds.width-contentViewWidth)/3
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("🍎\(indexPath)")
        // 이전에 선택한 셀의 테두리를 제거
        if let previousSelectedIndexPath = selectedCellIndexPath,
           let previousSelectedCell = collectionView.cellForItem(at: previousSelectedIndexPath) as? MartShoppingCollectionViewCell {
            previousSelectedCell.isSelectedBorderEnabled = false
        }
        
        // 현재 선택한 셀의 테두리를 주황색으로 설정
        if let selectedCell = collectionView.cellForItem(at: indexPath) as? MartShoppingCollectionViewCell {
            selectedCell.isSelectedBorderEnabled = true
        }
        
        // 현재 선택한 셀의 인덱스를 저장
        selectedCellIndexPath = indexPath
        
        // 클릭된 셀에 해당하는 데이터를 가져와서 커스텀뷰에 적용
        let item = martShoppingpDataArray[0].items[indexPath.item]
        martShoppingContentView.imageView.image = item.foodImageView
        martShoppingContentView.titleLabel.text = item.titleLabel
        martShoppingContentView.saleLabel.text = item.saleLabel
        martShoppingContentView.originPriceLabel.text = item.originPriceLabel
        martShoppingContentView.salePriceLabel.text = item.salePriceLabel
    }
}
//MARK: -GiveMindTableViewCell:마음을 선물
class GiveMindTableViewCell: UITableViewCell {
    static let reuseIdentifier = "GiveMindTableViewCell"

    
    let shopDataManager = ShopDataManager()
    var shopDataArray: [ShopSection] = []
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
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
        
        collectionView.register(GiveMindCollectionViewCell.self, forCellWithReuseIdentifier: GiveMindCollectionViewCell.reuseIdentifier)
        
        shopDataManager.makeShopData()
        shopDataArray = shopDataManager.getShopData()
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
 
    
}
extension GiveMindTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopDataArray[4].items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GiveMindCollectionViewCell.reuseIdentifier, for: indexPath) as! GiveMindCollectionViewCell
        let image = shopDataArray[4].items[indexPath.item].image
        let text = shopDataArray[4].items[indexPath.item].text
        cell.imageView.image = image
        cell.label.text = text
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = contentView.bounds.width * 0.34
        let height = contentView.bounds.height  
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
//MARK: -GoodTasteTableViewCell:전국의 별미
class GoodTasteTableViewCell: UITableViewCell {
    static let reuseIdentifier = "GoodTasteTableViewCell"

    
    let shopDataManager = ShopDataManager()
    var shopDataArray: [ShopSection] = []
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false

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
        
        collectionView.register(GoodTasteCollectionViewCell.self, forCellWithReuseIdentifier: GoodTasteCollectionViewCell.reuseIdentifier)
        contentView.addSubview(collectionView)
        
        shopDataManager.makeShopData()
        shopDataArray = shopDataManager.getShopData()
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
extension GoodTasteTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopDataArray[5].items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GoodTasteCollectionViewCell.reuseIdentifier, for: indexPath) as! GoodTasteCollectionViewCell
        let image = shopDataArray[5].items[indexPath.item].image
        
        cell.imageView.image = image
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = contentView.bounds.width * 0.45
        let height = contentView.bounds.height
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
  
}
//MARK: -DoThisWorkTableViewCell: 이런 일도 한답니다
class DoThisWorkTableViewCell: UITableViewCell {
   
        static let reuseIdentifier = "DoThisWorkTableViewCell"

        
        let shopDataManager = ShopDataManager()
        var shopDataArray: [ShopSection] = []
        private lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.showsHorizontalScrollIndicator = false

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
            
            collectionView.register(DoThisWorkCollectionViewCell.self, forCellWithReuseIdentifier: DoThisWorkCollectionViewCell.reuseIdentifier)
            contentView.addSubview(collectionView)
            
            shopDataManager.makeShopData()
            shopDataArray = shopDataManager.getShopData()
            
            collectionView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
        
    }
    extension DoThisWorkTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            print("🍎\(shopDataArray[6])")
            return shopDataArray[6].items.count
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoThisWorkCollectionViewCell.reuseIdentifier, for: indexPath) as! DoThisWorkCollectionViewCell
            let image = shopDataArray[6].items[indexPath.item].image
            let text = shopDataArray[6].items[indexPath.item].text
            cell.imageView.image = image
            cell.label.text = text
            
            return cell
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let height: CGFloat
                
                switch indexPath.item {
                case 0:
                    height = contentView.bounds.width * 0.4
                case 1:
                    height = contentView.bounds.width *  0.56
                case 2:
                    height = contentView.bounds.width * 0.56
                case 3:
                    height = contentView.bounds.width * 0.4
                default:
                    height = 0.0
                }
                
            let width = contentView.bounds.width * 0.5 - 18
                return CGSize(width: width, height: height)
            
            
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 15
        }
      
    }
