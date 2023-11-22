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
        RadioMenu(id: 1, isChecked: true, name: "10알", price: 6500),
        RadioMenu(id: 2, isChecked: false, name: "20알", price: 12000),
        RadioMenu(id: 3, isChecked: false, name: "30알", price: 17500)
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
        Menu(id: 1, isChecked: false, name: "닭강정 소스 추가", price: 1000),
        Menu(id: 2, isChecked: false, name: "와사비마요 추가", price: 2000),
        Menu(id: 3, isChecked: false, name: "크리미 어니언 추가", price: 2000),
        Menu(id: 4, isChecked: false, name: "닭강정 소스 추가", price: 1000),
        Menu(id: 5, isChecked: false, name: "와사비마요 추가", price: 1000),
        Menu(id: 6, isChecked: false, name: "크리미 어니언 추가", price: 3000),
        Menu(id: 7, isChecked: false, name: "돈가스 소스 추가", price: 1500),
        Menu(id: 8, isChecked: false, name: "불닭 소스 추가", price: 2500),
        Menu(id: 9, isChecked: false, name: "갈릭디핑 추가", price: 2300),
        
        Menu(id: 10, isChecked: false, name: "펩시 콜라 500ml", price: 2000),
        Menu(id: 11, isChecked: false, name: "칠성 사이다 500ml", price: 2000),

        Menu(id: 12, isChecked: false, name: "[Best] 타코 와사비 100g]", price: 8000),
        Menu(id: 13, isChecked: false, name: "[오독오독] 소라 와사비 100g]", price: 8900),
        Menu(id: 14, isChecked: false, name: "치킨 가라아게 200g", price: 69000),
        Menu(id: 15, isChecked: false, name: "버팔로 윙(날개) 6조각", price: 69000),
        Menu(id: 16, isChecked: false, name: "버팔로 윙(다리) 6조각", price: 7000),
        Menu(id: 17, isChecked: false, name: "치킨 텐더 6조각", price: 15000),
        Menu(id: 18, isChecked: false, name: "[인기최고] 닭껍질 후라이드100g", price: 22500),
        Menu(id: 19, isChecked: false, name: "닭똥집 200g", price: 23000),
    ]
}
