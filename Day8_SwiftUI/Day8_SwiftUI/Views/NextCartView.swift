//
//  NextCartView.swift
//  Day8_SwiftUI
//
//  Created by 박다미 on 2023/11/22.
//

import SwiftUI


struct NextCartView: View {
    
    var selectedRadioMenu: [RadioMenu]
    var selectedMenus: [Menu]
    var totalPrice: Int
    var count: Int
    
    var body: some View {
        VStack {
            HStack {
                Text("[열혈 시그니처] 열혈타코 오리지널")
                Spacer()
                Image(systemName: "xmark")
                    .onTapGesture {
                        
                    }
            }
            .padding(.horizontal)
            .padding(.top, 10)
            VStack{
                HStack {
                    Image("foodImage")
                        .resizable()
                        .frame(width: 80, height: 80)
                    Spacer(minLength: 10)
                    VStack(alignment: .leading) {
                        
                        Text("・ 가격: \(selectedRadioMenu.map { "\($0.name) (\($0.price)원)" }.joined(separator: " / "))")
                            .font(.system(size: 15,weight: .regular))
                            .tint(Color("customGray1"))
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        Text("・ 사이드 추가선택: \(selectedMenus.map { "\($0.name)(\($0.price)원)" }.joined(separator: " / "))")
                        
                            .font(Font.system(size: 15))
                            .tint(Color("customGray1"))
                            .lineLimit(nil)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        
                        Text("\(totalPrice)원")
                    }
                    
                   
                    
                }
                Spacer()
                HStack{
                    Spacer()
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: 60, height: 30)
                        .overlay(
                            Text("옵션변경")
                                .font(Font.system(size: 12))
                                .fontWeight(.light)
                                .foregroundColor(.gray)
                        )
                        .onTapGesture {
                        }
                    
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: 65, height: 30)
                        .overlay(
                            Text("-  \(count)  +")
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                        )
                        .onTapGesture {
                        }
                    
                }
            }
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 10, trailing: 10))
            
        }
        .background(Color.white)
        
    }
}
