//
//  DataManager.swift
//  1_BeaMin_Layout
//
//  Created by 박다미 on 2023/09/19.
//

import Foundation
import UIKit

struct ShopItem{
    let image: UIImage?
    let text: String
}
struct ShopSection{
    let headerTitle :String?
    let headerImage :UIImage
    let headerButton:UIImage?
    let items: [ShopItem]
}
class ShopDataManager{
    private var shopDataArray: [ShopSection] = []
    
    func makeShopData() {
        shopDataArray = [
            ShopSection(headerTitle: "우리 동네 빠른 배달",headerImage: UIImage(named: "header 1")!, headerButton: nil, items: [
                    ShopItem(image: UIImage(named: "1"), text: "Item 1"),
                    ShopItem(image: UIImage(named: "1"), text: "Item 2"),
                    ShopItem(image: UIImage(named: "1"), text: "Item 3"),
                    ShopItem(image: UIImage(named: "1"), text: "Item 4"),
                    ShopItem(image: UIImage(named: "1"), text: "Item 5"),
                    ShopItem(image: UIImage(named: "1"), text: "Item 5")
                ]),
                ShopSection(headerTitle: "최근에 주문했어요",headerImage: UIImage(named: "header 2")!, headerButton: UIImage(systemName: "chevron.right"), items: [
                    ShopItem(image: UIImage(named: "1"), text: "케이크"),
                    ShopItem(image: UIImage(named: "1"), text: "텀플러/보온병"),
                    ShopItem(image: UIImage(named: "1"), text: "머그/컵"),
                    ShopItem(image: UIImage(named: "1"), text: "라이프스타일"),
                    ShopItem(image: UIImage(named: "1"), text: "티/커피용품"),
                    ShopItem(image: UIImage(named: "1"), text: "세트"),
                    ShopItem(image: UIImage(named: "1"), text: "스낵")
    
                ]),
                ShopSection(headerTitle: "오늘의 할인 ",headerImage: UIImage(named: "header 3")!, headerButton: UIImage(systemName: "chevron.right"), items: [
                    ShopItem(image: UIImage(named: "1"), text: "Item 1"),
                    ShopItem(image: UIImage(named: "1"), text: "Item 2")
                ]),
                ShopSection(headerTitle: "B마트 장보기 특가",headerImage: UIImage(named: "header 4")!, headerButton: nil, items: [
                    ShopItem(image: UIImage(named: "1"), text: "Item 1"),
                    ShopItem(image: UIImage(named: "1"), text: "Item 2"),
                    ShopItem(image: UIImage(named: "1"), text: "Item 3"),
                    ShopItem(image: UIImage(named: "1"), text: "Item 4"),
                    ShopItem(image: UIImage(named: "1"), text: "Item 5"),
                    ShopItem(image: UIImage(named: "1"), text: "Item 5")
                ]),
                ShopSection(headerTitle: "마음을 선물해보세요",headerImage: UIImage(named: "header 5")!, headerButton: UIImage(systemName: "chevron.right"), items: [
                    ShopItem(image: UIImage(named: "1"), text: "케이크"),
                    ShopItem(image: UIImage(named: "1"), text: "텀플러/보온병"),
                    ShopItem(image: UIImage(named: "1"), text: "머그/컵"),
                    ShopItem(image: UIImage(named: "1"), text: "라이프스타일"),
                    ShopItem(image: UIImage(named: "1"), text: "티/커피용품"),
                    ShopItem(image: UIImage(named: "1"), text: "세트"),
                    ShopItem(image: UIImage(named: "1"), text: "스낵")
    
                ]),
                ShopSection(headerTitle: "전국의 별미가 한가득",headerImage: UIImage(named: "header 6")!, headerButton: UIImage(systemName: "chevron.right"), items: [
                    ShopItem(image: UIImage(named: "1"), text: "Item 1"),
                    ShopItem(image: UIImage(named: "1"), text: "Item 2")
                ]),
            ShopSection(headerTitle: "이런 일도 한답니다",headerImage: UIImage(named: "header 7")!, headerButton: UIImage(systemName: "chevron.right"), items: [
                    ShopItem(image: UIImage(named: "1"), text: "Item 1"),
                    ShopItem(image: UIImage(named: "1"), text: "Item 2")
                ])
              
            ]
    }
    func getShopData() -> [ShopSection] {
        return shopDataArray
    }
}


