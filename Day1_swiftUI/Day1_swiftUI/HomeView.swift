//
//  HomeView.swift
//  Day1_swiftUI
//
//  Created by 박다미 on 2023/11/07.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            NavigationStack {
                VStack {
                    ZStack {
                        Color.white
                            .ignoresSafeArea()
                    ContentView()
                        .navigationBarItems(
                            leading: Text("남동구 소래역로 93 ▾")
                                .foregroundColor(.white)
                                .font(.system(size: 20,weight: .bold)),
                            
                            trailing: HStack{
                                Button(action: {}){
                                    Image(systemName: "square.split.2x2")
                                }
                                Button(action:{}){
                                    Image(systemName: "bell")
                                }
                                Button(action:{}){
                                    Image(systemName: "cart")
                                }
                            }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                            
                        ).foregroundColor(.white)
                        .toolbarBackground(.indigo, for: .navigationBar)
                      .toolbarBackground(.visible, for: .navigationBar)
                    
                        ScrollView{
                            
                            SearchBar()
                                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))// 서치 바
                                .background(.indigo)
                              
                                //.cornerRadius(10)
                            
                            GeometryReader { geometry in
                                VStack{
                                    HStack(alignment: .center, spacing: 5) {
                                        
                                        FirstView(title: "배달", subTitle: "요즘배민 맛집은?", image: "맨위1")
                                            .frame(width: (geometry.size.width - 30) / 3, height: (geometry.size.width - 30) / 3)
                                        
                                        FirstView(title: "B마트", subTitle: "장보기도 더빠르게!", image: "맨위2")
                                            .frame(width: (geometry.size.width - 30) / 3, height: (geometry.size.width - 30) / 3)
                                        
                                        FirstView(title: "배민스토어", subTitle: "요즘배민 맛집은?", image: "맨위3")
                                            .frame(width: (geometry.size.width - 30) / 3, height: (geometry.size.width - 30) / 3)
                                        
                                        
                                    }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                    
                                    SaleView()
                                    
                                    BannerView()
                                }
                            }
                        }.background(.gray)
                }
            }
                
            }.background(Color.gray)
        }
    }
}
struct SearchBar: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.indigo)
            TextField("찾는 메뉴가 뭐예요?", text: $searchText)
                .background(Color.white)
                .cornerRadius(3)
                .padding(5)
        }
        .padding(EdgeInsets(top: 15, leading: 8, bottom: 15, trailing: 8))

        .frame(height: 40)
        .background(Color.white)
        .padding(EdgeInsets(top: 6, leading: 8, bottom: 6, trailing: 8))

    }
}
#Preview {
    HomeView()
}
//struct SearchBar: View {
//    @Binding var text: String
//    
//    var body: some View {
//        HStack {
//            Image(systemName: "magnifyingglass")
//                .foregroundStyle(.green)
//            TextField("찾는 맛집 이름이 뭐예요?", text: $text)
//        }
//        .frame(height: 40)
//        .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
//        .background(Color(.secondarySystemBackground))
//        .padding()
//    }
//}
