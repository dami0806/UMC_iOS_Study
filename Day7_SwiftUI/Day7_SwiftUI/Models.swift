//
//  Models.swift
//  Day7_SwiftUI
//
//  Created by 박다미 on 2023/11/13.
//

import Foundation
import SwiftUI

struct Goods{
    var goodsImage: Image
    var goodsTitle: String
    var locationLabel: String
    var goodsPrice: String
}
let HorizontaldummyGoods: [Goods] =
    [Goods(
        goodsImage: Image("goods"),
        goodsTitle: "에어팟 프로 1세대",
        locationLabel: "논현동 . 1분 전",
        goodsPrice: "100,000원"
    ),
     Goods(
         goodsImage: Image("goods 2"),
         goodsTitle: "옛날 공기",
         locationLabel: "도림동 . 10시간 전",
         goodsPrice: "54,000원"
     ),
     Goods(
         goodsImage: Image("goods 3"),
         goodsTitle: "트랜스포머 로봇",
         locationLabel: "정왕동 . 13분 전",
         goodsPrice: "7,000원"
     ),
     Goods(
         goodsImage: Image("goods 4"),
         goodsTitle: "물고기 잡기놀이",
         locationLabel: "연수동 . 15분 전",
         goodsPrice: "30,000원"
     ),
     Goods(
         goodsImage: Image("goods 1"),
         goodsTitle: "고양이 장난감",
         locationLabel: "논현동 . 10분 전",
         goodsPrice: "20,000원"
     ),
     Goods(
         goodsImage: Image("goods 5"),
         goodsTitle: "로봇세트 2",
         locationLabel: "구월동 . 3분 전",
         goodsPrice: "30,000원"
     ),
     Goods(
         goodsImage: Image("goods 6"),
         goodsTitle: "블록놀이",
         locationLabel: "연수동 . 3시간 전",
         goodsPrice: "5,000원"
     ),
     Goods(
         goodsImage: Image("goods 7"),
         goodsTitle: "곰인형",
         locationLabel: "논현동 . 12분 전",
         goodsPrice: "40,000원"
     ),
     Goods(
         goodsImage: Image("goods 8"),
         goodsTitle: "쿠로미",
         locationLabel: "구월동 . 35분 전",
         goodsPrice: "30,000원"
     ),
     Goods(
         goodsImage: Image("goods 9"),
         goodsTitle: "뽀로로장난감",
         locationLabel: "도림동 . 40분 전",
         goodsPrice: "200,000원"
     )
     ]

let dummyGoods: [Goods] =
   [Goods(
       goodsImage: Image("goods"),
       goodsTitle: "에어팟 프로 1세대",
       locationLabel: "논현동 . 1분 전",
       goodsPrice: "100,000원"
   ),
    Goods(
        goodsImage: Image("goods 2"),
        goodsTitle: "옛날 공기",
        locationLabel: "도림동 . 10시간 전",
        goodsPrice: "54,000원"
    ),
    Goods(
        goodsImage: Image("goods 3"),
        goodsTitle: "트랜스포머 로봇",
        locationLabel: "정왕동 . 13분 전",
        goodsPrice: "7,000원"
    ),
    Goods(
        goodsImage: Image("goods 4"),
        goodsTitle: "물고기 잡기놀이",
        locationLabel: "연수동 . 15분 전",
        goodsPrice: "30,000원"
    ),
    Goods(
        goodsImage: Image("goods 1"),
        goodsTitle: "고양이 장난감",
        locationLabel: "논현동 . 10분 전",
        goodsPrice: "20,000원"
    ),
    Goods(
        goodsImage: Image("goods 5"),
        goodsTitle: "로봇세트 2",
        locationLabel: "구월동 . 3분 전",
        goodsPrice: "30,000원"
    ),
    Goods(
        goodsImage: Image("goods 6"),
        goodsTitle: "블록놀이",
        locationLabel: "연수동 . 3시간 전",
        goodsPrice: "5,000원"
    ),
    Goods(
        goodsImage: Image("goods 7"),
        goodsTitle: "곰인형",
        locationLabel: "논현동 . 12분 전",
        goodsPrice: "40,000원"
    ),
    Goods(
        goodsImage: Image("goods 8"),
        goodsTitle: "쿠로미",
        locationLabel: "구월동 . 35분 전",
        goodsPrice: "30,000원"
    ),
    Goods(
        goodsImage: Image("goods 9"),
        goodsTitle: "뽀로로장난감",
        locationLabel: "도림동 . 40분 전",
        goodsPrice: "200,000원"
    )
    ]

