//
//  DataManager.swift
//  2_CarrotMarket_Scroll
//
//  Created by 박다미 on 2023/09/26.
//

import Foundation
import UIKit
struct Category{
    let image:UIImage?
    let text:String
}
class HomeCategoryDataManager {
    private var homeCagetoryDataArray: [Category] = []
    func makeHomeCategoryData(){
        homeCagetoryDataArray = [Category(image: UIImage(named: "카테고리1")!, text: ""),
                                 Category(image: UIImage(named: "카테고리2")!, text: "알바"),
                                 Category(image: UIImage(named: "카테고리3")!, text: "부동산"),
                                 Category(image: UIImage(named: "카테고리4")!, text: "중고차"),
        ]
    }
    func gethomeCagegoryDataArrayCellData() -> [Category] {
        return homeCagetoryDataArray
    }
}
struct Goods{
    let goodsImage: UIImage?
    let goodsTitle: String
    let locationLabel: String
    let reservationImage: UIImage?
    let goodsPrice: String
    
}
class HomeCellDataManager {
    private var homeDataArray: [Goods] = []
    func makeHomeData(){
        homeDataArray = [Goods(goodsImage: UIImage(named: "goods")!, goodsTitle: "에어팟 프로 1세대", locationLabel: "논현동 . 1분 전", reservationImage: .none, goodsPrice: "100,000원"),
                         Goods(goodsImage: UIImage(named: "goods")!, goodsTitle: "에어팟 프로 1세대", locationLabel: "논현동 . 1분 전", reservationImage: .none, goodsPrice: "100,000원"),
                         Goods(goodsImage: UIImage(named: "goods")!, goodsTitle: "에어팟 프로 1세대", locationLabel: "논현동 . 1분 전", reservationImage: .none, goodsPrice: "100,000원"),
                         Goods(goodsImage: UIImage(named: "goods")!, goodsTitle: "에어팟 프로 1세대", locationLabel: "논현동 . 1분 전", reservationImage: UIImage(named: "예약중")!, goodsPrice: "100,000원"),
                         Goods(goodsImage: UIImage(named: "goods")!, goodsTitle: "에어팟 프로 1세대", locationLabel: "논현동 . 1분 전", reservationImage: .none, goodsPrice: "100,000원"),
                         Goods(goodsImage: UIImage(named: "goods")!, goodsTitle: "에어팟 프로 1세대", locationLabel: "논현동 . 1분 전", reservationImage: .none, goodsPrice: "100,000원"),
                         Goods(goodsImage: UIImage(named: "goods")!, goodsTitle: "에어팟 프로 1세대", locationLabel: "논현동 . 1분 전", reservationImage: .none, goodsPrice: "100,000원"),
                         Goods(goodsImage: UIImage(named: "goods")!, goodsTitle: "에어팟 프로 1세대", locationLabel: "논현동 . 1분 전", reservationImage: UIImage(named: "예약중")!, goodsPrice: "100,000원")
                         
                         
        ]
        
        
    }
    func gethomeGoodsDataArrayCellData() -> [Goods] {
        return homeDataArray
    }
}
