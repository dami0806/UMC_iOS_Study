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

class MyCartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var selectedItems: [MenuCheckBox] = []
    
    let tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.reuseIdentifier)
        tableView.register(CartTotalTableViewCell.self, forCellReuseIdentifier: CartTotalTableViewCell.reuseIdentifier)
        
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - UITableViewDataSource
    
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
           
            //배열 모든 합
            let totalOrderPrice = totalpriceArray.reduce(0, +)
                cell.finalPayCostLabel.text = "\(totalOrderPrice)원"
                cell.payCostLabel.text = "\(totalOrderPrice)원"
                
                return cell
             
            
        }

            else{
                let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.reuseIdentifier, for: indexPath) as! CartTableViewCell
                
                let sectionItems = TotalPriceManager.shared.selectedMenuArray[indexPath.section]
                let sectionTotalPrice = TotalPriceManager.shared.totalPriceArray[indexPath.section]
                let sectionCount = TotalPriceManager.shared.sectionCountArray[indexPath.section]

                // 해당 섹션의 모든 항목을 순회하면서 정보 결합
                var addDoughInfo = ""
                var addPizzaInfo = ""
                var addSideInfo = ""
                var addOtherInfo = ""
                
                for (index, menuItem) in sectionItems.enumerated() {
                    // 항목 정보를 해당 필드에 추가
                    switch menuItem.sectionNum {
                    case 2:
                        if !addDoughInfo.isEmpty {
                            addDoughInfo += " / "
                        }
                        addDoughInfo += "\(menuItem.menu) (\(menuItem.price)원)"
                    case 3:
                        if !addPizzaInfo.isEmpty {
                            addPizzaInfo += " / "
                        }
                        addPizzaInfo += "\(menuItem.menu) (\(menuItem.price)원)"
                    case 4:
                        if !addSideInfo.isEmpty {
                            addSideInfo += " / "
                        }
                        addSideInfo += "\(menuItem.menu) (\(menuItem.price)원)"
                    case 5:
                        if !addOtherInfo.isEmpty {
                            addOtherInfo += " / "
                        }
                        addOtherInfo += "\(menuItem.menu) (\(menuItem.price)원)"
                    default:
                        break
                    }
                }
                
                // 셀에 데이터 전달
                cell.configure(
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == TotalPriceManager.shared.selectedMenuArray.count{
            return 200
        }
        return 200
        
        
    }
    
}
