//
//  HorizontalScrollViewCell.swift
//  Day7_SwiftUI
//
//  Created by 박다미 on 2023/11/13.
//

import SwiftUI

struct HorizontalScrollViewCell: View {
    var goods: Goods
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20){
                ForEach(0..<10){_ in
                    VStack {
                        goods.goodsImage
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                        Text(goods.goodsTitle)
                            .font(.system(size: 15, weight: .light))
                            .foregroundColor(Color.black)
                        Text(goods.goodsPrice)
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(Color.black)
                    }.frame(width: 100)
                }
            }
        }
    }
}
/*
 var goods: Goods

 var body: some View {
     ScrollView(.horizontal, showsIndicators: false) {
         HStack(spacing: 20) {
             ForEach(0..<10) { _ in
                 VStack {
                     goods.goodsImage
                         .resizable()
                         .frame(width: 100, height: 100)
                         .cornerRadius(10)
                     Text(goods.goodsTitle)
                         .font(.system(size: 18, weight: .regular))
                         .foregroundColor(Color.black)
                     Text(goods.goodsPrice)
                         .font(.system(size: 18, weight: .bold))
                         .foregroundColor(Color.black)
                 }
                 .frame(width: 100)
             }
         }
     }
 }
}
 */

