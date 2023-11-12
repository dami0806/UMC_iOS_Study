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

let dummyGoods: [Goods] = (0..<10).map { index in
    Goods(
        goodsImage: Image("goods\(index)"), // 실제 이미지와 매칭되는 이름으로 변경
        goodsTitle: "에어팟 프로 1세대",
        locationLabel: "논현동 . 1분 전",
        goodsPrice: "100,000원"
    )
}
