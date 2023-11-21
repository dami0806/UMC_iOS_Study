//
//  MenuViewModel.swift
//  Day8_SwiftUI
//
//  Created by 박다미 on 2023/11/20.
//

import Foundation

class OrderViewModel: ObservableObject {
    @Published var radioMenus: [RadioMenu] = []
    @Published var menus: [Menu] = []
    
    @Published var selectedMenusHistory: [[Menu]]
    @Published var selectedRadioMenusHistory: [[Menu]]
    
    @Published var totalPrice: Int = 0
    @Published var allTotalCount: Int = 0
    @Published var allTotalPrice: Int = 0
    
    @Published var totalPriceHistory: [Int] = []
    @Published var totalCountHistory: [Int] = []
    
    @Published var count: Int = 1
    
    init(){
        
        selectedMenusHistory = []
        selectedRadioMenusHistory = []
        totalPriceHistory = []
        totalCountHistory = []
        //더미
        radioMenus = RadioMenu.dummyData
        menus = Menu.dummyData
    }
    var selectedMenus: [Menu] {
        menus.filter { $0.isChecked}
    }
    
    func updateRadoiMenuSelection(selectedId: Int){
        for i in radioMenus.indices {
            radioMenus[i].isChecked = (radioMenus[i].id == selectedId)
        }
        updateTotals()
        
    }
    
    func changeCount(_ change: Int) {
        count += change
        print(change)
        print(count)
        updateTotals()
        
    }
    func updateTotals() {
        totalPrice = selectedMenus.map { $0.price * count }.reduce(0, +)
    }

    func resetAndCalculateAllTotals() {
        allTotalCount += count
        allTotalPrice += totalPrice
        
        // 선택된 메뉴들의 기록을 저장
        selectedMenusHistory.append(selectedMenus)
        totalPriceHistory.append(totalPrice)
        totalCountHistory.append(count)
        
        // 메뉴들을 초기화
        for i in menus.indices {
            menus[i].isChecked = false
        }
        for i in menus.indices {
            menus[i].isChecked = false
        }
        totalPrice = 0
        count = 1
    }
}
