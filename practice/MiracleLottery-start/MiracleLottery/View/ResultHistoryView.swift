//
//  ResultHistoryView.swift
//  MiracleLottery
//
//  Created by 김예원 on 2022/10/25.
//

import SwiftUI

struct ResultHistoryView: View {
    @ObservedObject var menuData: MenuData
    
    var body: some View {
        
       // var resultList = menuData.menuResultList //참조가 안됨.. 직접쓰자..
        List {
            ForEach(menuData.menuResultList,id: \.self) { element in
                Text(element)
            }.onDelete { index in
                menuData.menuResultList.remove(atOffsets: index)
            }
        }
    }
}

//struct ResultHistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultHistoryView()
//    }
//}
