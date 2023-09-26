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
                         Goods(goodsImage: UIImage(named: "goods")!, goodsTitle: "에어팟 프로 1세대", locationLabel: "논현동 . 1분 전", reservationImage: UIImage(named: "예약중")!, goodsPrice: "100,000원"),
                         Goods(goodsImage: UIImage(named: "goods")!, goodsTitle: "에어팟 프로 1세대", locationLabel: "논현동 . 1분 전", reservationImage: .none, goodsPrice: "100,000원"),
                         Goods(goodsImage: UIImage(named: "goods")!, goodsTitle: "에어팟 프로 1세대", locationLabel: "논현동 . 1분 전", reservationImage: .none, goodsPrice: "100,000원"),
                         Goods(goodsImage: UIImage(named: "goods")!, goodsTitle: "에어팟 프로 1세대", locationLabel: "논현동 . 1분 전", reservationImage: .none, goodsPrice: "100,000원"),
                         Goods(goodsImage: UIImage(named: "goods")!, goodsTitle: "에어팟 프로 1세대", locationLabel: "논현동 . 1분 전", reservationImage: UIImage(named: "예약중")!, goodsPrice: "100,000원")

                         
                         
        ]
        
        
    }
    
    func makeHomeAdData(){
        homeDataArray = [Goods(goodsImage: UIImage(named: "광고")!, goodsTitle: "스팸 복합 1호 추석 명절 선물세트", locationLabel: "논현동 . 1분 전", reservationImage: .none, goodsPrice: "15,000원"),
                         Goods(goodsImage: UIImage(named: "광고 1")!, goodsTitle: "오희숙명인 찹쌀부각세트 선물세트", locationLabel: "논현동 . 1분 전", reservationImage: .none, goodsPrice: "13,000원"),
                         Goods(goodsImage: UIImage(named: "광고 2")!, goodsTitle: "서산시 명인 생강한과 추석선물 명절 선물세트", locationLabel: "논현동 . 1분 전", reservationImage: .none, goodsPrice: "14,000원"),
                         Goods(goodsImage: UIImage(named: "광고")!, goodsTitle: "스팸 복합 1호 추석 명절 선물세트", locationLabel: "논현동 . 1분 전", reservationImage: .none, goodsPrice: "15,000원"),
                         Goods(goodsImage: UIImage(named: "광고 1")!, goodsTitle: "오희숙명인 찹쌀부각세트 선물세트", locationLabel: "논현동 . 1분 전", reservationImage: .none, goodsPrice: "13,000원"),
                         Goods(goodsImage: UIImage(named: "광고 2")!, goodsTitle: "서산시 명인 생강한과 추석선물 명절 선물세트", locationLabel: "논현동 . 1분 전", reservationImage: .none, goodsPrice: "14,000원"),
                         Goods(goodsImage: UIImage(named: "광고")!, goodsTitle: "스팸 복합 1호 추석 명절 선물세트", locationLabel: "논현동 . 1분 전", reservationImage: .none, goodsPrice: "15,000원"),
                         Goods(goodsImage: UIImage(named: "광고 1")!, goodsTitle: "오희숙명인 찹쌀부각세트 선물세트", locationLabel: "논현동 . 1분 전", reservationImage: .none, goodsPrice: "13,000원"),
                         Goods(goodsImage: UIImage(named: "광고 2")!, goodsTitle: "서산시 명인 생강한과 추석선물 명절 선물세트", locationLabel: "논현동 . 1분 전", reservationImage: .none, goodsPrice: "14,000원")]
    }
    
    func gethomeGoodsDataArrayCellData() -> [Goods] {
        return homeDataArray
    }
}
