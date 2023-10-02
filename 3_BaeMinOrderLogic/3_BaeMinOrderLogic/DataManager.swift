//
//  DataManager.swift
//  3_BaeMinOrderLogic
//
//  Created by 박다미 on 2023/10/02.
//

import Foundation
import UIKit

//라디오버튼, 라벨,라벨
struct MenuRadio {
    var radioButtonSelected: Bool
    var menu: String
    var price: Int
}
//체크박스
struct MenuCheckBox {
    var checkBoxSelected: Bool
    var menu: String
    var price: Int
}

struct MenuCheckBoxSection{
    var menu: [MenuCheckBox]
}

struct Header{
    var headerTitle: String
    var subTitle: String
    var selectImage: UIImage?
}

//헤더
class HeaderDataManager{
    private var headerDataArray: [Header] = []
    func makeHeaderData() {
        headerDataArray = [
            Header(headerTitle: "고구마피자", subTitle: "서브타이틀 1", selectImage: UIImage(named: "selectImage1")),
            Header(headerTitle: "가격", subTitle: "서브타이틀 1", selectImage: UIImage(named: "필수")),
            Header(headerTitle: "도우 추가선택", subTitle: "서브타이틀 1", selectImage: UIImage(named: "선택")),
            Header(headerTitle: "피자 추가선택", subTitle: "서브타이틀 1", selectImage: UIImage(named: "선택")),
            Header(headerTitle: "사이드 추가선택", subTitle: "서브타이틀 1", selectImage: UIImage(named: "선택")),
            Header(headerTitle: "기타 추가선택", subTitle: "서브타이틀 1", selectImage: UIImage(named: "선택")),
            Header(headerTitle: "수량", subTitle: "서브타이틀 1", selectImage: nil)
            
        ]
    }
    func getHeaderData() -> [Header] {
        return headerDataArray
    }
}

//라디오버튼
class MenuRadioDataManager{
    private var menuRadioDataArray: [MenuRadio] = []
    func makeMenuRadioData() {
        menuRadioDataArray = [
            MenuRadio(radioButtonSelected: true, menu: "M", price: 18900),
            MenuRadio(radioButtonSelected: false, menu: "L", price: 20900)
            
        ]
    }
    func getMenuRadioData() -> [MenuRadio] {
        return menuRadioDataArray
    }
}

//체크박스
class MenuCheckBoxDataManager{
    private var menuCheckBoxDataArray: [MenuCheckBoxSection] = []
    func makeMenuCheckBoxData() {
        menuCheckBoxDataArray = [
            MenuCheckBoxSection(menu: [
                MenuCheckBox(checkBoxSelected: false, menu: "치즈크러스트", price: 3000),
                MenuCheckBox(checkBoxSelected: false, menu: "고구마크러스트", price: 5000),
                MenuCheckBox(checkBoxSelected: false, menu: "골드", price: 6000),
                MenuCheckBox(checkBoxSelected: false, menu: "소보로", price: 2000)]),
            
            MenuCheckBoxSection(menu: [
              
                MenuCheckBox(checkBoxSelected: false, menu: "치즈 추가", price: 3600)]),
            
            MenuCheckBoxSection(menu: [
                MenuCheckBox(checkBoxSelected: false, menu: "치즈오븐스파게티", price: 2000),
                MenuCheckBox(checkBoxSelected: false, menu: "치킨텐더 9조각", price: 6000),
                MenuCheckBox(checkBoxSelected: false, menu: "치킨텐더 18조각", price: 5700),
                MenuCheckBox(checkBoxSelected: false, menu: "버팔로핫윙10조각", price: 2300)]),
            MenuCheckBoxSection(menu: [
                MenuCheckBox(checkBoxSelected: false, menu: "치즈크러스트", price: 35800),
                MenuCheckBox(checkBoxSelected: false, menu: "치즈크러스트", price: 34320)])
            
            
        ]
    }
    func getMenuCheckBoxData() -> [MenuCheckBoxSection] {
        return menuCheckBoxDataArray
    }
}

class TotalPriceManager {
    static let shared = TotalPriceManager()
    
    private init() {}
    
    var totalPrice: Int = 0 
    var totalCount: Int = 1
}
