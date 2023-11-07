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
        GeometryReader { geometry in
            
            VStack(alignment: .leading){
                Text(title)
                    .font(.system(size: 18, weight: .bold))
                
                Text(subTitle)
                    .font(.system(size: 13, weight: .medium))
            }
            .overlay(
                Image(image)
                    .resizable()
                    .scaledToFit()
                
                    .frame(width: geometry.size.width * 0.3)
                    .aspectRatio(1,contentMode: .fill)
                    .offset(x: 30, y: 30)
                    .padding(.leading, 3)
            )
            
            .padding([.bottom, .trailing], 20.0)
            .aspectRatio(1,contentMode: .fill)
            .frame(width: geometry.size.width ,height: geometry.size.width)
            .background(.white)
            .cornerRadius(10)
        }
    }
}


#Preview {
    FirstView(title: "배달", subTitle: "요즘배민 맛집은?", image: "맨위1")
}
