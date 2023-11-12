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
                        ContentView()
                            .toolbar {
                                ToolbarItemGroup(placement: .navigationBarLeading) {
                                    Text("남동구 소래역로 93 ▾")
                                }
                                ToolbarItemGroup(placement: .navigationBarTrailing) {
                                    Button(action: {
                                    }) {
                                        Image(systemName: "square.split.2x2")
                                    }
                                    Button(action: {
                                    }) {
                                        Image(systemName: "bell")
                                    }
                                    Button(action: {
                                    }) {
                                        Image(systemName: "cart")
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
