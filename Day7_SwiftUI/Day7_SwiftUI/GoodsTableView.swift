//
//  GoodsTableView.swift
//  Day7_SwiftUI
//
//  Created by 박다미 on 2023/11/13.
//

import SwiftUI

struct GoodsTableView: View {
   
    var body: some View {
        ScrollView {
            
            VStack(spacing: 20) {
                ForEach(dummyGoods.indices, id: \.self) { index in
                    if index == 4{
                        HorizontalScrollView(goods: HorizontaldummyGoods[index])
                      
                            .frame(maxWidth: .infinity)
                    }else{
                        TableViewCell(goods: dummyGoods[index])
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    GoodsTableView()
}
