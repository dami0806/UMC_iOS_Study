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
struct StoreItem{
    let foodImageView: UIImage?
    let storeLabel: String
    let scoreLabel: String
    
    let deliveryLabel: String
    let deliveryTextLabel: String
    
    let deliveryTipLabel: String
    let deliveryTipTextLabel: String
    
    let uiImageView: UIImage?
    
    
}
struct ShopSection{
    let headerTitle :String?
    let headerImage :UIImage
    let headerButton:UIImage?
    let items: [ShopItem]
}
struct StoreSection{
    let headerTitle :String?
    let headerImage :UIImage
    let headerButton:UIImage?
    let items: [StoreItem]
    /*
     contentView.addSubview(foodImageView)
     contentView.addSubview(storeLabel)
     contentView.addSubview(scoreLabel)
     contentView.addSubview(deliveryLabel)
     contentView.addSubview(deliveryTextLabel)
     contentView.addSubview(deliveryTipLabel)
     contentView.addSubview(deliveryTipTextLabel)
     contentView.addSubview(uiImageView)
     */
}
class SecondCellDataManager {
    private var secondDataArray: [ShopItem] = []
    func makesecondData(){
        secondDataArray = [
            ShopItem(image: UIImage(named: "주문1")!, text: "알뜰배달"),
            ShopItem(image: UIImage(named: "주문2")!, text: "돈가스.회"),
            ShopItem(image: UIImage(named: "주문3")!, text: "피자"),
            ShopItem(image: UIImage(named: "주문4")!, text: "중식"),
            ShopItem(image: UIImage(named: "주문5")!, text: "치킨"),
            ShopItem(image: UIImage(named: "주문6")!, text: "버거"),
            ShopItem(image: UIImage(named: "주문7")!, text: "분식"),
            ShopItem(image: UIImage(named: "주문8")!, text: "디저트"),
            ShopItem(image: UIImage(named: "주문9")!, text: "족발.보쌈"),
            ShopItem(image: UIImage(named: "주문10")!, text: "전체보기"),
            
        ]
        
    }
    func getSecondCellData() -> [ShopItem] {
        return secondDataArray
    }
}
class TopViewfourDataManager {
    private var topViewfourDataArray: [ShopItem] = []
    func maketopViewfourData(){
        topViewfourDataArray = [
            ShopItem(image: UIImage(named: "topView4Image")!, text: "대용량특가"),
            ShopItem(image: UIImage(named: "topView4Image 1")!, text: "포장"),
            ShopItem(image: UIImage(named: "topView4Image 2")!, text: "전국별미"),
            ShopItem(image: UIImage(named: "topView4Image 3")!, text: "선물하기")
            
            
        ]
        
    }
    func gettopViewfourCellData() -> [ShopItem] {
        return topViewfourDataArray
    }
}
class StoreDataManager{
    private var storeDataArray: [StoreSection] = []
    
    func makeStoreData() {
        storeDataArray = [
            StoreSection(headerTitle: "우리 동네 빠른 배달",headerImage: UIImage(named: "header 1")!,headerButton: nil,
                         items: [
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달")),
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달")),
                
                
            ]),
            StoreSection(headerTitle: "최근에 주문했어요",headerImage: UIImage(named: "header 2")!, headerButton: UIImage(systemName: "chevron.right"),
                         items: [
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달")),
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달")),
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달")),
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달")),
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달")),
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달")),
                
                
            ]),
            StoreSection(headerTitle: "오늘의 할인 ",headerImage: UIImage(named: "header 3")!, headerButton: UIImage(systemName: "chevron.right"), items: [
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달")),
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달")),
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달")),
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달"))
                
                
                
            ]),
            StoreSection(headerTitle: "최근에 주문했어요",headerImage: UIImage(named: "header 2")!, headerButton: UIImage(systemName: "chevron.right"), items: [
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달")),
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달"))
                
                
            ]),
            StoreSection(headerTitle: "오늘의 할인 ",headerImage: UIImage(named: "header 3")!, headerButton: UIImage(systemName: "chevron.right"), items: [
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달")),
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달"))
                
                
            ]),
            StoreSection(headerTitle: "B마트 장보기 특가",headerImage: UIImage(named: "header 4")!, headerButton:
                            UIImage(systemName: "chevron.right"), items: [
                                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달")),
                                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달"))
                            ]),
            StoreSection(headerTitle: "마음을 선물해보세요",headerImage: UIImage(named: "header 5")!, headerButton: UIImage(systemName: "chevron.right"), items: [
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달")),
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달"))
            ]),
            StoreSection(headerTitle: "전국의 별미가 한가득",headerImage: UIImage(named: "header 6")!, headerButton: UIImage(systemName: "chevron.right"), items: [
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달")),
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달"))
            ]),
            StoreSection(headerTitle: "이런 일도 한답니다",headerImage: UIImage(named: "header 7")!, headerButton: UIImage(systemName: "chevron.right"), items: [
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달")),
                StoreItem(foodImageView: UIImage(named: "짜장면"), storeLabel: "짬뽕타임", scoreLabel: "⭐️4.8", deliveryLabel: "배달", deliveryTextLabel: "15~43분", deliveryTipLabel: "배달팁", deliveryTipTextLabel: "0원~3,000원", uiImageView: UIImage(named: "알뜰배달"))
            ])
            
        ]
    }
    func getStoreData() -> [StoreSection] {
        return storeDataArray
    }
}
class ShopDataManager{
    private var shopDataArray: [ShopSection] = []
    
    func makeShopData() {
        shopDataArray = [
            ShopSection(headerTitle: "우리 동네 빠른 배달",headerImage: UIImage(named: "header 1")!, headerButton: nil, items: [
                
                ShopItem(image: UIImage(named: "1"), text: ""),
                ShopItem(image: UIImage(named: "1"), text: ""),
                ShopItem(image: UIImage(named: "1"), text: ""),
                ShopItem(image: UIImage(named: "1"), text: ""),
                ShopItem(image: UIImage(named: "1"), text: ""),
                ShopItem(image: UIImage(named: "1"), text: "")
            ]),
            ShopSection(headerTitle: "최근에 주문했어요",headerImage: UIImage(named: "header 2")!, headerButton: UIImage(systemName: "chevron.right"), items: [
                ShopItem(image: UIImage(named: "1"), text: ""),
                ShopItem(image: UIImage(named: "1"), text: ""),
                ShopItem(image: UIImage(named: "1"), text: ""),
                ShopItem(image: UIImage(named: "1"), text: ""),
                ShopItem(image: UIImage(named: "1"), text: ""),
                ShopItem(image: UIImage(named: "1"), text: ""),
                ShopItem(image: UIImage(named: "1"), text: "")
                
            ]),
            //2
            ShopSection(headerTitle: "오늘의 할인 ",headerImage: UIImage(named: "header 3")!, headerButton: UIImage(systemName: "chevron.right"), items: [
                ShopItem(image: UIImage(named: "오늘의 할인"), text: ""),
                ShopItem(image: UIImage(named: "오늘의 할인 1"), text: ""),
                ShopItem(image: UIImage(named: "오늘의 할인 2"), text: ""),
                ShopItem(image: UIImage(named: "오늘의 할인"), text: ""),
                ShopItem(image: UIImage(named: "오늘의 할인 1"), text: ""),
                ShopItem(image: UIImage(named: "오늘의 할인 2"), text: "")
            ]),
            //3
            ShopSection(headerTitle: "B마트 장보기 특가",headerImage: UIImage(named: "header 4")!, headerButton: nil, items: [
                ShopItem(image: UIImage(named: "1"), text: "Item 1"),
                ShopItem(image: UIImage(named: "1"), text: "Item 2"),
                ShopItem(image: UIImage(named: "1"), text: "Item 3"),
                ShopItem(image: UIImage(named: "1"), text: "Item 4"),
                ShopItem(image: UIImage(named: "1"), text: "Item 5"),
                ShopItem(image: UIImage(named: "1"), text: "Item 5")
            ]),
            //4
            ShopSection(headerTitle: "마음을 선물해보세요",headerImage: UIImage(named: "header 5")!, headerButton: UIImage(systemName: "chevron.right"), items: [
                ShopItem(image: UIImage(named: "마음을선물"), text: "보름달처럼 밝고 가득찬 한가위 되세요"),
                ShopItem(image: UIImage(named: "마음을선물 1"), text: "마음만은 가까운 한가위 되세요"),
                ShopItem(image: UIImage(named: "마음을선물 2"), text: "보름달처럼 밝고 가득찬 한가위 되세요"),
                ShopItem(image: UIImage(named: "마음을선물 3"), text: "보름달처럼 밝고 가득찬 한가위 되세요"),
                ShopItem(image: UIImage(named: "마음을선물"), text: "마음만은 가까운 한가위 되세요"),
             
                
            ]),
            //5
            ShopSection(headerTitle: "전국의 별미가 한가득",headerImage: UIImage(named: "header 6")!, headerButton: UIImage(systemName: "chevron.right"), items: [
                ShopItem(image: UIImage(named: "전국의별미"), text: "Item 1"),
                ShopItem(image: UIImage(named: "전국의별미 1"), text: "Item 2"),
                ShopItem(image: UIImage(named: "전국의별미 2"), text: "Item 1"),
                ShopItem(image: UIImage(named: "전국의별미"), text: "Item 2"),
                ShopItem(image: UIImage(named: "전국의별미 1"), text: "Item 1"),
                ShopItem(image: UIImage(named: "전국의별미 2"), text: "Item 2"),
                
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


