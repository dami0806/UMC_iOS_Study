//
//  SaleButton.swift
//  Day1_swiftUI
//
//  Created by 박다미 on 2023/11/06.
//

import SwiftUI

struct SaleButton: View {
    
    var imageStr: String
    var titleStr: String
    var body: some View{
        
        Button(action: {}, label: {
            VStack{
                Image(imageStr)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30,height: 30)
                Text(titleStr)
                    .font(.system(size: 10, weight: .regular))
            }
            .foregroundColor(.black)
            .padding()
            .background(.white)
        })
    }
}


#Preview {
    SaleButton(imageStr: "주문1", titleStr: "알뜰배달")
}
