//
//  Model.swift
//  Day8_SwiftUI
//
//  Created by 박다미 on 2023/11/19.
//

import Foundation

struct RadioMenu {
    var id: Int
    var name: String
    var price: Int
    var isChecked : Bool //라디오값
    
    
    init(id: Int, isChecked: Bool = false, name: String, price: Int) {
        self.id = id
        self.isChecked = isChecked
        self.name = name
        self.price = price
        
    }
    static let dummyData: [RadioMenu] = [
        RadioMenu(id: 1, isChecked: false, name: "10알", price: 100),
        RadioMenu(id: 2, isChecked: false, name: "20알", price: 200)
    ]
}
struct Menu {
    var id: Int
    var name: String
    var price: Int
    var isChecked : Bool
    
    
    init(id: Int, isChecked: Bool = false, name: String, price: Int) {
        self.id = id
        self.isChecked = isChecked
        self.name = name
        self.price = price
        
    }
    static let dummyData: [Menu] = [
        Menu(id: 1, isChecked: false, name: "닭강정 소스 추가", price: 500),
        Menu(id: 2, isChecked: false, name: "와사비마요 추가", price: 7005),
        Menu(id: 3, isChecked: false, name: "크리미 어니언 추가", price: 5000),
        Menu(id: 4, isChecked: false, name: "닭강정 소스 추가", price: 500),
        Menu(id: 5, isChecked: false, name: "와사비마요 추가", price: 7005),
        Menu(id: 6, isChecked: false, name: "크리미 어니언 추가", price: 5000)
    ]
}
