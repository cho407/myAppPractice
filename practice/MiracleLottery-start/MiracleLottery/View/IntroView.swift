//
//  IntoView.swift
//  MiracleLottery
//
//  Created by 김예원 on 2022/10/24.
//

import SwiftUI

struct IntroView: View {
    
    @ObservedObject var menuData :MenuData = MenuData()
    
    var body: some View {
        
        NavigationView{
            VStack{
                Text("우리는 무적의 10조")
                Text("무엇이든 돌려드립니다.")
                .padding()
                //esc
                NavigationLink(destination: LunchView(menuData: menuData)){
                    Text("점메추")
                      .frame(width: 180, height: 50, alignment: .center)
                      .background(.pink)
                      .foregroundColor(.white)
                      .cornerRadius(10)

                }.onAppear(perform: menuData.resetData)
                .padding()
                NavigationLink(destination: DinnerView(menuData: menuData)){
                    Text("저메추")
                      .frame(width: 180, height: 50, alignment: .center)
                      .background(.purple)
                      .foregroundColor(.white)
                      .cornerRadius(10)

                }.onAppear(perform: menuData.resetData)
                .padding()
                if let recentData = menuData.menuResultList.last{
                    Text("최근 돌림판 결과는\(recentData)입니다.")
                    .padding()
                }else{
                    Text("아직 메뉴를 고르지 않았습니다.")
                }
                NavigationLink(destination: ResultHistoryView(menuData: menuData)){
                    
                    Text("결과")
                        .frame(width: 180, height: 50, alignment: .center)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

            }
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
