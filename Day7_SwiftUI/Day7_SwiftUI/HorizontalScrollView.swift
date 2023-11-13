//
//  HorizontalScrollView.swift
//  Day7_SwiftUI
//
//  Created by 박다미 on 2023/11/13.
//

import SwiftUI

struct HorizontalScrollView: View {
    var goods: Goods
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Text("김장의 계절, 주방용품 구경해요 🥬")
                    .font(.system(size: 20,weight: .bold))
                    .padding(.leading, 10)
                Spacer()
                Button("", systemImage: "chevron.forward") {
                }.padding(.trailing, 10)
            }
            HorizontalScrollViewCell(goods: goods)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
        }
    }
}

