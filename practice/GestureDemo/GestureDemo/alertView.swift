//
//  AlertView.swift
//  GestureDemo
//
//  Created by 조형구 on 2022/11/01.
//

import SwiftUI

struct AlertView: View {
    @Binding var showing: Bool
    @Binding var showingTwo: Bool
    
    var body: some View {
        VStack {
        Spacer()
           Image("full").resizable().frame(width: 250, height: 200).padding(.top, 10)
            Spacer()
             Text("만원입니다. 안돼 돌아가").foregroundColor(Color.white)
            Spacer()
            Divider()
            
            Button(action: {
                    self.showingTwo = false
                    self.showing = false
            }, label: {
                Text("확인")
                    .foregroundColor(.white) // Change the title of button
                         .frame(width: 300, height: 40) // Change the frames of button
            })
        
                    }.frame(width: UIScreen.main.bounds.width-50, height: 300)
                 
                 .background(Color.black.opacity(0.4))
                 .cornerRadius(12)
                 .clipped()
               
      
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(showing:.constant(false), showingTwo: .constant(false))
    }
}
