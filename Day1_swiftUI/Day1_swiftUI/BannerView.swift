//
//  BannerView.swift
//  Day1_swiftUI
//
//  Created by 박다미 on 2023/11/07.
//

import SwiftUI

struct BannerView: View {
    var body: some View {
        Image("배너")
            .resizable()
            .cornerRadius(10)
    }
}

#Preview {
    BannerView()
}
 
