//
//  SaleView.swift
//  Day1_swiftUI
//
//  Created by 박다미 on 2023/11/06.
//

import SwiftUI

struct SaleView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack{
                HStack{
                    HStack{
                        //헤더쪽
                        Text("알뜰・한집배달")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 20))
                        
                        Text("배민1은 365일 할인중!")
                            .fontWeight(.medium)
                            .font(.system(size: 13))
                    }
                    .frame(alignment: .leading)
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "chevron.forward")
                            .resizable()
                            .frame(width: 10,height: 15)
                            .foregroundColor(.black)
                    })
                }
                .padding(.leading, 5)
                .padding(.trailing, 5)
                HStack(spacing: 5){
                    SaleButton(imageStr: "주문1", titleStr: "알뜰배달")
                    SaleButton(imageStr: "주문2", titleStr: "알뜰배달")
                    SaleButton(imageStr: "주문3", titleStr: "알뜰배달")
                    SaleButton(imageStr: "주문4", titleStr: "알뜰배달")
                    SaleButton(imageStr: "주문5", titleStr: "알뜰배달")
                }.padding([.leading, .bottom, .trailing]).frame(width: geometry.size.width - 10)
                  
                HStack(spacing: 5){
                    SaleButton(imageStr: "주문6", titleStr: "알뜰배달")
                    SaleButton(imageStr: "주문7", titleStr: "알뜰배달")
                    SaleButton(imageStr: "주문8", titleStr: "알뜰배달")
                    SaleButton(imageStr: "주문9", titleStr: "알뜰배달")
                    SaleButton(imageStr: "주문10", titleStr: "알뜰배달")
                }.padding([.leading, .bottom, .trailing]).frame(width: geometry.size.width - 10)
            }.padding(.horizontal,5)
                .padding(.vertical,5)
                .background(.white)
                .cornerRadius(10)
        }
    }
}

#Preview {
    SaleView()
}
