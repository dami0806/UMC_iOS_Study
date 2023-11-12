//
//  NaviView.swift
//  Day7_SwiftUI
//
//  Created by 박다미 on 2023/11/13.
//

import SwiftUI

struct NaviView: View {
    var body: some View {
        TabView {
            Group {
                HomeView()
                    .tabItem {Label("홈",systemImage: "house")}
                
                Text("Tab Content 2")
                    .tabItem {Label("동네생활",systemImage: "newspaper")}
                Text("Tab Content 2")
                    .tabItem {Label("내 근처",systemImage: "mappin.and.ellipse")}
                Text("Tab Content 2")
                    .tabItem {Label("채팅",systemImage: "bubble.left.and.bubble.right")}
                Text("Tab Content 2")
                    .tabItem {Label("나의 당근",systemImage: "person")}
            }
            .toolbarBackground(.white, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            
        }
        .accentColor(.black)
    
    }
}


#Preview {
    NaviView()
}
