//
//  DataManager.swift
//  3_BaeMinOrderLogic
//
//  Created by 박다미 on 2023/10/02.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

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
    var sectionNum: Int
}
//전체 가격, 개수, 체크박스정보
struct getMenu{
 var menu: [MenuCheckBox]
    var totalPrice: Int
    var totalNum : Int

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
            Header(headerTitle: "가격", subTitle: "", selectImage: nil),
            Header(headerTitle: "도우 추가선택", subTitle: "최대 1개 선택", selectImage: UIImage(named: "선택")),
            Header(headerTitle: "피자 추가선택", subTitle: "최대 1개 선택", selectImage: UIImage(named: "선택")),
            Header(headerTitle: "사이드 추가선택", subTitle: "최대 11개 선택", selectImage: UIImage(named: "선택")),
            Header(headerTitle: "기타 추가선택", subTitle: "최대 3개 선택", selectImage: UIImage(named: "선택")),
            Header(headerTitle: "수량", subTitle: "", selectImage: nil)
            
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
                MenuCheckBox(checkBoxSelected: false, menu: "치즈크러스트", price: 3000, sectionNum : 2),
                MenuCheckBox(checkBoxSelected: false, menu: "고구마크러스트", price: 5000,sectionNum : 2),
                MenuCheckBox(checkBoxSelected: false, menu: "골드", price: 6000, sectionNum : 2),
                MenuCheckBox(checkBoxSelected: false, menu: "소보로", price: 2000, sectionNum : 2)]),
            
            MenuCheckBoxSection(menu: [
              
                MenuCheckBox(checkBoxSelected: false, menu: "치즈 추가", price: 3600 , sectionNum : 3)]),
            
            MenuCheckBoxSection(menu: [
                MenuCheckBox(checkBoxSelected: false, menu: "치즈오븐스파게티", price: 2000, sectionNum : 4),
                MenuCheckBox(checkBoxSelected: false, menu: "치킨텐더 9조각", price: 6000, sectionNum : 4),
                MenuCheckBox(checkBoxSelected: false, menu: "치킨텐더 18조각", price: 5700, sectionNum : 4),
                MenuCheckBox(checkBoxSelected: false, menu: "버팔로핫윙10조각", price: 2300, sectionNum : 4)]),
                
            MenuCheckBoxSection(menu: [
                MenuCheckBox(checkBoxSelected: false, menu: "치즈크러스트", price: 35800, sectionNum : 5),
                MenuCheckBox(checkBoxSelected: false, menu: "치즈크러스트", price: 34320, sectionNum : 5)])
            
            
        ]
    }
    func getMenuCheckBoxData() -> [MenuCheckBoxSection] {
        return menuCheckBoxDataArray
    }
}

class TotalPriceManager {
    static let shared = TotalPriceManager()
    
    private init() {}
     let _totalPrice = BehaviorRelay<Int>(value: 0)
       
       var totalPrice: Int {
           get {
               return _totalPrice.value
           }
           set {
               _totalPrice.accept(newValue)
           }
       }
    //var totalPrice: Int = 0
    var totalCount: Int = 1
    var selectedMenuItems: [MenuCheckBox] = []
    var selectedMenuArray: [[MenuCheckBox]] = []
    
    var totalPriceArray : [Int] = []
}
