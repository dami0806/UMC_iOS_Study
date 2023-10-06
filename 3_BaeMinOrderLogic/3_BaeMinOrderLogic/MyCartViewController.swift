//
//  MyCartViewController.swift
//  3_BaeMinOrderLogic
//
//  Created by 박다미 on 2023/10/03.
//

import Foundation
import SnapKit
import UIKit
import RxCocoa
import RxSwift

class MyCartViewController: UIViewController{
    var selectedItems: [MenuCheckBox] = []
    private let bottomGetView : BottomCartGetView = {
        let view = BottomCartGetView()
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 0.3
        return view
    }()
    let deliverTip = 2500//피자집배달팁
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        fetchData()
        setUI()
    }



    private func fetchData(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.reuseIdentifier)
        tableView.register(CartTotalTableViewCell.self, forCellReuseIdentifier: CartTotalTableViewCell.reuseIdentifier)
        
    }
    private func setUI(){
        view.addSubview(bottomGetView)
        view.addSubview(tableView)
        
        bottomGetView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(view.snp.width).multipliedBy(0.25)
        }
        tableView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(bottomGetView.snp.top)
            
        }
    }
    
}
// MARK: - UITableViewDataSource
extension MyCartViewController :UITableViewDataSource, UITableViewDelegate {
 
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TotalPriceManager.shared.selectedMenuArray.count+1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == TotalPriceManager.shared.selectedMenuArray.count {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CartTotalTableViewCell.reuseIdentifier, for: indexPath) as! CartTotalTableViewCell
            var totalpriceArray = TotalPriceManager.shared.totalPriceArray
            var totalCountArray = TotalPriceManager.shared.totalCountArray
            //배열 모든 합
            let totalOrderPrice = totalpriceArray.reduce(0, +)
            let totalCount = totalCountArray.reduce(0, +)
            let formmetNum = (numberWithComma(totalOrderPrice + deliverTip))
            cell.finalPayCostLabel.text = "\(formmetNum)원"  //배달비까지 합
            bottomGetView.getTotalLabel.text = "\(formmetNum)원"
            cell.tipCostLabel.text = "\(numberWithComma(deliverTip))원"
            cell.payCostLabel.text = "\(numberWithComma(totalOrderPrice))원"
            bottomGetView.totalCountLabel.text = "\(totalCount)"
            return cell
        }
        
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.reuseIdentifier, for: indexPath) as! CartTableViewCell
            
            let sectionItems = TotalPriceManager.shared.selectedMenuArray[indexPath.section]
            let sectionTotalPrice = TotalPriceManager.shared.totalPriceArray[indexPath.section]
            let sectionCount = TotalPriceManager.shared.sectionCountArray[indexPath.section]
            
            // 해당 섹션의 모든 항목을 순회하면서 정보 결합
            var menuPriceInfo = ""
            var addDoughInfo = ""
            var addPizzaInfo = ""
            var addSideInfo = ""
            var addOtherInfo = ""
            print(TotalPriceManager.shared.selectedMenuArray[indexPath.section])
            for (_, menuItem) in sectionItems.enumerated() {
                let formmetNum = (numberWithComma(menuItem.price))
                
                // 항목 정보를 해당 필드에 추가
                switch menuItem.sectionNum {
                case 1:
                    //나중에 1개로만 되게 할것
                    if !menuPriceInfo.isEmpty {
                        menuPriceInfo += " / "
                    }
                    menuPriceInfo += "\(menuItem.menu) (\(formmetNum)원)"
                case 2:
                    if !addDoughInfo.isEmpty {
                        addDoughInfo += " / "
                    }
                    addDoughInfo += "\(menuItem.menu) (\(formmetNum)원)"
                case 3:
                    if !addPizzaInfo.isEmpty {
                        addPizzaInfo += " / "
                    }
                    addPizzaInfo += "\(menuItem.menu) (\(formmetNum)원)"
                case 4:
                    if !addSideInfo.isEmpty {
                        addSideInfo += " / "
                    }
                    addSideInfo += "\(menuItem.menu) (\(formmetNum)원)"
                case 5:
                    if !addOtherInfo.isEmpty {
                        addOtherInfo += " / "
                    }
                    addOtherInfo += "\(menuItem.menu) (\(formmetNum)원)"
                default:
                    break
                }
            }
            // 셀에 데이터 전달
            cell.configure(
                menuPrice:menuPriceInfo,
                addDough: addDoughInfo,
                addPizza: addPizzaInfo,
                addSide: addSideInfo,
                addOther: addOtherInfo,
                totalPrice: Int(sectionTotalPrice),
                sectionNum: indexPath.section,
                totalCount: sectionCount
            )
            return cell
        }
   
    
}
    
}
