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
    var price: String
}
//체크박스
struct MenuCheckBox {
    var checkBoxSelected: Bool
    var menu: String
    var price: String
}

struct MenuCheckBoxSection{
    let menu: [MenuCheckBox]
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
            MenuRadio(radioButtonSelected: false, menu: "M", price: "18,900원"),
            MenuRadio(radioButtonSelected: false, menu: "L", price: "20,900원")
            
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
                MenuCheckBox(checkBoxSelected: false, menu: "a", price: "3,000원"),
                MenuCheckBox(checkBoxSelected: false, menu: "aa", price: "3,000원"),
                MenuCheckBox(checkBoxSelected: false, menu: "aaa", price: "3,000원")]),
            
            MenuCheckBoxSection(menu: [
                MenuCheckBox(checkBoxSelected: false, menu: "b", price: "3,000원"),
                MenuCheckBox(checkBoxSelected: false, menu: "bb", price: "3,000원")]),
            
            MenuCheckBoxSection(menu: [
                MenuCheckBox(checkBoxSelected: false, menu: "bbb", price: "3,000원"),
                MenuCheckBox(checkBoxSelected: false, menu: "bbbb", price: "3,000원"),
                MenuCheckBox(checkBoxSelected: false, menu: "bbbbb", price: "3,000원"),
                MenuCheckBox(checkBoxSelected: false, menu: "치즈크러스트", price: "3,000원")]),
            MenuCheckBoxSection(menu: [
                MenuCheckBox(checkBoxSelected: false, menu: "치즈크러스트", price: "3,000원"),
                MenuCheckBox(checkBoxSelected: false, menu: "치즈크러스트", price: "3,000원")]),
            MenuCheckBoxSection(menu: [
                MenuCheckBox(checkBoxSelected: false, menu: "치즈크러스트", price: "3,000원"),
                MenuCheckBox(checkBoxSelected: false, menu: "치즈크러스트", price: "3,000원")]),
            
            MenuCheckBoxSection(menu: [
                MenuCheckBox(checkBoxSelected: false, menu: "치즈크러스트", price: "3,000원"),
                MenuCheckBox(checkBoxSelected: false, menu: "치즈크러스트", price: "3,000원")])
            
            
        ]
    }
    func getMenuCheckBoxData() -> [MenuCheckBoxSection] {
        return menuCheckBoxDataArray
    }
}
