//
//  FirstView.swift
//  Day1_swiftUI
//
//  Created by 박다미 on 2023/11/06.
//

import SwiftUI

struct FirstView: View {
    var title: String
    var subTitle: String
    var image: String
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text(title)
                .font(.system(size: 20, weight: .bold))
            
            Text(subTitle)
                .font(.system(size: 13, weight: .medium))
            
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
        }.padding(10)
            .aspectRatio(1,contentMode: .fill)
            .background(.white)
            .cornerRadius(10)
    }
}

#Preview {
    FirstView(title: "배달", subTitle: "요즘배민 맛집은?", image: "맨위1")
}
