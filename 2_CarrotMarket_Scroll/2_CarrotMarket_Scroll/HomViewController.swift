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
    
    final let writeViewHeight = 50
    final let deliverViewWeight = 100
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
    //글쓰기
    private lazy var writeView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.layer.cornerRadius = CGFloat(writeViewHeight)*0.5
        return view
    }()
    private lazy var writeStackView: UIStackView = {
        let st = UIStackView()
        st.axis = .horizontal
        st.alignment = .center
        st.spacing = 3
        st.distribution = .equalSpacing
        writeView.addSubview(st)
        return st
    }()
    
    private lazy var writeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "plus")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        writeStackView.addArrangedSubview(imageView)
        return imageView
    }()
    private lazy var writeLabel: UILabel = {
        let label = UILabel()
        label.text = "글쓰기"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        writeStackView.addArrangedSubview(label)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        settingNaviItem()
        addSubviews()
        setTableView()
        setCollectionView()
        scrollView.delegate = self
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
        
        bottomView.addSubview(writeView)
        
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
            make.height.equalTo(500)//임의의 수 ->적용 안됨
            
        }
        writeView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20) // 오른쪽으로 20만큼 여백
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.width.equalTo(deliverViewWeight) // 너비 설정
            make.height.equalTo(writeViewHeight) // 높이 설정
            writeView.clipsToBounds = true //잘라내기
        }
        writeStackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(writeView).inset(10)
            make.leading.trailing.equalTo(writeView).inset(30)
            
        }
        
        writeImage.snp.makeConstraints { make in
            make.width.height.equalTo(writeViewHeight-20)
        }
        writeLabel.isHidden = false
        
    }
    private func calculateTableViewHeight() -> CGFloat {
       
        let numberOfCells =  homeGoodsDataArray.count
        let cellHeight: CGFloat = view.frame.width*0.3
        let totalHeight = CGFloat(numberOfCells-1) * cellHeight + view.frame.width*0.8
        return totalHeight
    }
    // 테이블뷰 높이를 계산하고 업데이트하는 메서드
    private func updateTableViewHeight() {
        let newHeight = calculateTableViewHeight()
        tableView.snp.updateConstraints { make in
            make.height.equalTo(newHeight)
        }
        scrollView.layoutIfNeeded()
        tableView.reloadData() // 테이블뷰를 다시 로드
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
        let placeText = UIBarButtonItem(title: "도림동", style:.plain , target: self, action: #selector(buttonTapped))
        let bellButton = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(buttonTapped))
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(buttonTapped))
        placeText.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold)], for: .normal)

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
            return view.frame.width*0.37
        }
    }
    
    
}

extension HomeViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        
        updateTableViewHeight()

        guard let navi =  self.navigationController?.navigationBar else {
           return
        }
        let topContentOffsetY = navi.frame.height + 50 //+ categoryCollectionView.frame.height*0.8
     
        if scrollView.contentOffset.y <= -topContentOffsetY{
            // 스크롤이 맨 위일 때

            writeView.snp.updateConstraints { make in
                make.width.equalTo(deliverViewWeight)
            }
            writeStackView.snp.remakeConstraints { make in
                make.center.equalTo(writeView.snp.center)
            }
            
            writeImage.snp.remakeConstraints{make in
                make.width.height.equalTo(writeViewHeight-20)
                
            }
            writeLabel.isHidden = false
       
        }else {
            // 스크롤이 아래로 내려갔을 때

            writeView.snp.updateConstraints { make in
                make.width.equalTo(writeViewHeight)
                make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)

            }
            
            writeStackView.snp.remakeConstraints { make in
                //make.edges.equalTo(deliverView).inset(10)
                make.center.equalTo(writeView.snp.center)
                
            }
            writeImage.snp.remakeConstraints{make in
                make.width.height.equalTo(writeViewHeight-20)

            }
            writeLabel.isHidden = true
       
        }
        UIView.animate(withDuration: 0.16) {
            self.view.layoutIfNeeded()
        }
        
    }
}

