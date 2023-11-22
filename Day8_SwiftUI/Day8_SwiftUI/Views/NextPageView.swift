//
//  NextPageView.swift
//  Day8_SwiftUI
//
//  Created by 박다미 on 2023/11/22.
//

import SwiftUI

struct NextPageView: View {
    @ObservedObject var viewModel: OrderViewModel
    
    var body: some View {
        GeometryReader { geometry in

        VStack{
            List {
                Section(header: Text("").font(.headline)) {
                    ForEach(viewModel.selectedMenusHistory.indices, id: \.self) { index in
                        NextCartView(
                            selectedRadioMenu: viewModel.selectedRadioMenusHistory[index],
                            selectedMenus: viewModel.selectedMenusHistory[index],
                            totalPrice: viewModel.totalPriceHistory[index],
                            count: viewModel.totalCountHistory[index]
                        )
                    }
                }
                
                Section(header: Text("")) {
                    Text("배달로 받을게요")
                        .font(.headline)
                }
                Section(header: Text("")) {
                    VStack{
                        Spacer()
                        HStack {
                            
                            Text("총 주문금액")
                            Spacer()
                            Text("\(viewModel.allTotalPrice)원")
                        }
                        Spacer()
                        
                        HStack {
                            Text("배달팁")
                            Spacer()
                            Text("2,000원")
                        }
                        Spacer()
                        Divider()
                        HStack {
                            Text("결제예정금액")
                            
                            Spacer()
                            Text("\(viewModel.allTotalPrice + 2000)원")
                        }                                
                        .padding(.bottom,10)
                        
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("장바구니")
            
            ZStack{
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color("LogoColor"))
                    .frame(width: geometry.size.width * 0.85, height: 50)
                
                HStack{
                    Text("\(viewModel.totalPrice)원 담기")
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        .background(Color("LogoColor"))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .cornerRadius(5)
                    
                    Text("・ 알뜰배달 주문하기")
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        .background(Color("LogoColor"))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .cornerRadius(5)
                }
            }
            
        }
        }
    }
}

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
