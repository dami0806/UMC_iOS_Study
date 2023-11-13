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
let HorizontaldummyGoods: [Goods] = (0..<10).map { index in
    Goods(
        goodsImage: Image("goods"),
        goodsTitle: "에어팟 프로 1세대",
        locationLabel: "논현동 . 1분 전",
        goodsPrice: "100,000원"
    )
}
let dummyGoods: [Goods] = (0..<10).map { index in
    Goods(
        goodsImage: Image("goods"),
        goodsTitle: "에어팟 프로 1세대",
        locationLabel: "논현동 . 1분 전",
        goodsPrice: "100,000원"
    )
}
