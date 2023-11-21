//
//  HomeView.swift
//  Day7_SwiftUI
//
//  Created by 박다미 on 2023/11/13.
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
                        GoodsTableView()
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                            .toolbar {
                                ToolbarItemGroup(placement: .navigationBarLeading) {
                                    Text("남동구 소래역로 93 ▾")
                                }
                                ToolbarItemGroup(placement: .navigationBarTrailing) {
                                    Button(action: {
                                    }) {
                                        Image(systemName: "person.circle")
                                    }
                                    Button(action: {
                                    }) {
                                        
                                        Image(systemName: "magnifyingglass")
                                        
                                    }
                                    Button(action: {
                                    }) {
                                        Image(systemName: "bell")
                                    }
                                }
                            }.accentColor(.black)
                    }
                }
            }
        }
    }
}
#Preview {
    HomeView()
}
