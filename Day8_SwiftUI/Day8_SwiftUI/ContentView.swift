//
//  ContentView.swift
//  Day8_SwiftUI
//
//  Created by 박다미 on 2023/11/18.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var viewModel: OrderViewModel
    var body: some View {
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
                                set: {
                                    viewModel.radioMenus[index].isChecked = $0
                                    viewModel.updateTotals()
                                }
                            )
                        )
                    }
                    
                }
                
                Section(header: Text("소스 추가선택").font(.headline)) {
                    // 체크박스 뷰
                    ForEach(viewModel.menus.indices, id: \.self) { index in
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
                
                Section(header: Text("")) {
                    Text("음료 추가선택")
                        .font(.headline)
                    Text("최대 2개 선택")
                        .font(Font.system(size: 13))
                        .tint(Color("customGray"))
                    
                    
                }
                
                Section(header: Text("")) {
                    HStack {
                        Text("수량")
                        Text("ALL총 수량: \(viewModel.allTotalCount)개,총수량:\(viewModel.count), All가격:\(viewModel.allTotalPrice) 총 가격: \(viewModel.totalPrice)원")
                            .font(.headline)
                        Image(systemName: "minus.circle")
                            .onTapGesture {
                                decreaseCount()
                            }
                        
                        Text("\(viewModel.count)개")
                        
                        Image(systemName: "plus.circle")
                            .onTapGesture {
                                increaseCount()
                            }
                    }
                }
                
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("주문하기")
            
            // 바깥에 추가할 하단 뷰
            HStack {
                Spacer()
                
                Text("(Text 세로로 Text)")
                    .font(.headline)
                
                Button(action: {
                    // 버튼 눌렀을 때 로직 추가
                }) {
                    Text("\(viewModel.totalPrice)원")
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal) // 좌우 여백 추가
            .padding(.bottom, 20) // 하단 여백 추가
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
            Text("\(price)원")
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
            Text("\(price)원")
            
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
