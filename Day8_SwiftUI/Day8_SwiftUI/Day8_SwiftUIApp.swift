//
//  Day8_SwiftUIApp.swift
//  Day8_SwiftUI
//
//  Created by 박다미 on 2023/11/18.
//

import SwiftUI

@main
struct Day8_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: OrderViewModel())
        }
    }
}
