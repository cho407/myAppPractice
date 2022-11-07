//
//  AlertViewTwo.swift
//  GestureDemo
//
//  Created by 조형구 on 2022/11/02.
//

import SwiftUI

struct AlertViewTwo: View {
    @Binding var showingTwo: Bool
    
    var body: some View {
        VStack {
                         
           Image("full").resizable().frame(width: 250, height: 200).padding(.top, 10)
            Spacer()
             Text("만원입니다. 안돼 돌아가").foregroundColor(Color.white)
            Spacer()
            Divider()
            HStack {
                Button("확인") {
                    self.showingTwo = false
                    
                }.foregroundColor(.white) // Change the title of button
                 .frame(width: UIScreen.main.bounds.width/2-30, height: 40) // Change the frames of button
        
                  }
                    }.frame(width: UIScreen.main.bounds.width-50, height: 300)
                 
                 .background(Color.black.opacity(0.5))
                 .cornerRadius(12)
                 .clipped()
    }
}

//struct AlertViewTwo_Previews: PreviewProvider {
//    static var previews: some View {
//        AlertViewTwo()
//    }
//}
