//
//  TableViewCell.swift
//  Day7_SwiftUI
//
//  Created by 박다미 on 2023/11/13.
//

import SwiftUI

struct TableViewCell: View {
    var goods: Goods

    var body: some View {
        HStack{
            goods.goodsImage
                .resizable()
                .frame(width:100, height: 100)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(goods.goodsTitle)
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(Color.black)
                Text(goods.locationLabel)
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(Color.black)
                Text(goods.goodsPrice)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color.black)
            }
            Spacer()
        }
    }
}

#Preview {
    TableViewCell(goods: Goods(goodsImage: Image("goods"), goodsTitle: "상품", locationLabel: "지역", goodsPrice: "10000"))
}

  
