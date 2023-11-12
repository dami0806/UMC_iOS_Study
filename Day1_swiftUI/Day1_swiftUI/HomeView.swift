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
                        .toolbarBackground(Color("LogoColor"), for: .navigationBar)
                      .toolbarBackground(.visible, for: .navigationBar)
                        ScrollView{
                            
                            SearchBar()
                                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))// 서치 바
                                .background(Color("LogoColor"))
                                //.cornerRadius(10)
                            
                            GeometryReader { geometry in
                                VStack{
                                    let parentWidth = geometry.size.width
                                    Image("맨위광고")
                                        .resizable()
                                        .frame(width: parentWidth - 10)
                                        .aspectRatio(4,contentMode:.fill)
                                        .padding(.horizontal, 5)
                                    
                                    HStack(alignment:.center, spacing: 10) {
                                        
                                        FirstView(title: "배달", subTitle:"요즘 배민\n맛집은?", image: "맨위1")
                                        FirstView(title: "B마트", subTitle: "장보기도\n더빠르게!", image: "맨위2")
                                    
                                        FirstView(title: "배민스토어", subTitle: "배달은 지금\n옵니다", image: "맨위3")
                              
                                    }.padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5))
                                        .frame(width: geometry.size.width - 20, height: (geometry.size.width - 20) * 0.3, alignment: .center)
                                        Spacer()
                                    SaleView()
                                        .padding(EdgeInsets(top: 10, leading: 5, bottom: 0, trailing: 5))
                                        .frame(width: geometry.size.width - 20,height: (geometry.size.width - 20) * 0.65, alignment: .center)
                                    
                                    BannerView()
                                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                                        .frame(width: geometry.size.width - 20,height: (geometry.size.width - 20) * 0.3, alignment: .center)
                                }
                            }
                        }.background(Color("InterSpaceColor"))
                }
            }
            }
        }
    }
}
struct SearchBar: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color("LogoColor"))
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
