//
//  ContentView.swift
//  Day8_SwiftUI
//
//  Created by 박다미 on 2023/11/18.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: OrderViewModel
    @State private var stateNextPage = false
    
    var body: some View {
        NavigationStack {
            Text("")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack{
                            NavigationLink(
                                destination: NextPageView(viewModel: viewModel),
                                isActive: $stateNextPage,
                                label: {
                                    EmptyView()
                                }
                            )
                            Button(action: {}){
                                Image(systemName: "house")
                                    .tint(Color.black)
                            }
                            Button(action: {}){
                                Image(systemName: "arrow.up.right.square")
                                    .tint(Color.black)
                            }
                            
                            Button(action: {
                                stateNextPage = true
                            }){
                                ZStack{
                                    Image(systemName: "cart")
                                        .tint(Color.black)
                                    
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 20,height: 20)
                                        .padding(EdgeInsets(top: -10, leading: 10, bottom: 10, trailing: -10))
                                    Text("\(viewModel.allTotalCount)")
                                        .font(.system(size: 15,weight: .bold))
                                        .tint(Color.white)
                                        .padding(EdgeInsets(top: -10, leading: 10, bottom: 10, trailing: -10))
                                }
                            }
                        }
                    }
                }
            VStack{
                List {
                    VStack{
                        Image("foodImage")
                            .resizable()
                            .frame(height: 200)
                        Section(header: Text("")){
                            Text("[열혈 시그니처] 열혈타코 오리지널")
                            Text("메뉴 리뷰 54개 >")
                        }.padding(.leading, 10)
                    }
                    
                    Section(header: Text("가격").font(.headline)) {
                        ForEach(viewModel.radioMenus.indices, id: \.self) { index in
                            RadioButtonView(
                                title: viewModel.radioMenus[index].name,
                                price: viewModel.radioMenus[index].price,
                                isChecked: Binding(
                                    get: { viewModel.radioMenus[index].isChecked },
                                    set: {_ in
                                        for i in viewModel.radioMenus.indices {
                                            viewModel.radioMenus[i].isChecked = (i == index)
                                        }
                                        viewModel.updateTotals()
                                    }
                                )
                            )
                        }
                    }
                    
                    Section(header: Text("소스 추가선택").font(.headline)) {
                        // 체크박스 뷰
                        ForEach(viewModel.menus.indices, id: \.self) { index in
                            if viewModel.menus[index].id <= 9{
                                CheckBoxView(
                                    
                                    title: viewModel.menus[index].name,
                                    price: viewModel.menus[index].price,
                                    isChecked: Binding(
                                        get: { viewModel.menus[index].isChecked },
                                        set: {
                                            viewModel.menus[index].isChecked = $0
                                            viewModel.updateTotals()
                                        }
                                    )
                                )
                            }
                        }
                    }
                    
                    Section(header: Text("")) {
                        Text("음료 추가선택").font(.headline)
                        Text("최대 2개 선택")
                            .font(Font.system(size: 13))
                            .tint(Color("customGray"))
                        ForEach(viewModel.menus.indices,id: \.self) {index in
                            if viewModel.menus[index].id <= 11 && viewModel.menus[index].id > 9 {
                                CheckBoxView( title: viewModel.menus[index].name,
                                              price: viewModel.menus[index].price,
                                              isChecked: Binding(
                                                get: { viewModel.menus[index].isChecked },
                                                set: {
                                                    viewModel.menus[index].isChecked = $0
                                                    viewModel.updateTotals()
                                                })
                                )
                                
                            }
                        }
                    
                    }
                    Section(header: Text("")) {
                        Text("사이드 추가선택").font(.headline)
                        ForEach(viewModel.menus.indices,id: \.self) {index in
                            if viewModel.menus[index].id <= 19 && viewModel.menus[index].id > 11{
                                CheckBoxView( title: viewModel.menus[index].name,
                                              price: viewModel.menus[index].price,
                                              isChecked: Binding(
                                                get: { viewModel.menus[index].isChecked },
                                                set: {
                                                    viewModel.menus[index].isChecked = $0
                                                    viewModel.updateTotals()
                                                })
                                )
                                
                            }
                        }
                    }
                    
                    Section(header: Text("")) {
                        HStack {
                            Text("수량")
                                .font(Font.system(size: 18))
                                .fontWeight(.bold)
                          Spacer()
                            ZStack{
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color("customGray"), lineWidth: 1)
                                    .frame(width: 140, height: 45)
                                HStack {
                                    Image(systemName: "minus")
                                        .onTapGesture {
                                            decreaseCount()
                                        }
                                    
                                    Text("\(viewModel.count)개")
                                    
                                    Image(systemName: "plus")
                                        .onTapGesture {
                                            increaseCount()
                                        }
                                }
                                    
                            }
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("주문하기")
                
                // 바깥에 추가할 하단 뷰
                HStack {
                    VStack{
                        Text("배달최소주문금액")
                            .font(Font.system(size: 10))
                            .fontWeight(.light)
                            .foregroundColor(Color.gray)
                        Text("15,000")
                            .font(Font.system(size: 15))
                            .fontWeight(.light)
                            .foregroundColor(.black)
                    }

                    Button(action: {
                        viewModel.resetAndCalculateAllTotals()
                    }) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 5)
                                           .fill(Color("LogoColor"))
                                           .frame(width: 200, height: 50)
                            
                            Text("\(viewModel.totalPrice)원 담기")
                                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                                .background(Color("LogoColor"))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .cornerRadius(5)
                            
                                
                        }
                            
                    }
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))

                }
                
            }
        }
    }
    func decreaseCount() {
        viewModel.changeCount(-1)
    }
    
    func increaseCount() {
        viewModel.changeCount(+1)
    }
}

struct RadioButtonView: View {
    var title: String
    var price: Int
    @Binding var isChecked: Bool
    
    var body: some View {
        HStack {
            RadioButton(isChecked: $isChecked)
            Text(title)
            Spacer()
            Text("+\(price)원")
                .font(Font.system(size: 17))
                .fontWeight(.bold)
        
        }
    }
}

struct CheckBoxView: View {
    var title: String
    var price: Int
    @Binding var isChecked: Bool
    
    var body: some View {
        HStack {
            CheckBox(isChecked: $isChecked)
            Text(title)
            Spacer()
            Text("+\(price)원")
                .font(Font.system(size: 17))
                .fontWeight(.bold)
        }
    }
}

struct RadioButton: View {
    @Binding var isChecked: Bool
    var body: some View {
        Image(systemName: isChecked ? "dot.circle.fill" : "circle")
            .onTapGesture {
                isChecked.toggle()
            }
    }
}

struct CheckBox: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        Image(systemName: isChecked ? "checkmark.square" : "square")
            .onTapGesture {
                isChecked.toggle()
            }
    }
}
