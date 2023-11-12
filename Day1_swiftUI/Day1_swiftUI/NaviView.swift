//
//  NaviView.swift
//  Day1_swiftUI
//
//  Created by 박다미 on 2023/11/07.
//

import SwiftUI

struct NaviView: View {
    var body: some View {
        
        TabView {
            Group {
               
                HomeView()
                    .tabItem {Label("검색",image: "1")}
                
                Text("Tab Content 2")
                    .tabItem {Label("찜",image: "2")}
                Text("Tab Content 2")
                    .tabItem {Label("홈",image: "3")}
                Text("Tab Content 2")
                    .tabItem {Label("주문내역",image: "4")}
                Text("Tab Content 2")
                    .tabItem {Label("my배민",image: "5")}
                
            }
            .toolbarBackground(.white, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
      
        }
    }
    
}

#Preview {
    NaviView()
}
