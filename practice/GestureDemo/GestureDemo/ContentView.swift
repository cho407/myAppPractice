//
//  ContentView.swift
//  GestureDemo
//
//  Created by 조형구 on 2022/11/01.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var tapCountOne: Int = 0
    @State private var tapCountTwo: Int = 0
    @State private var dragAmount = CGSize.zero
    @State private var enabled = false
    @State private var showing = false
    @State private var showingTwo = false
    
    var body: some View {
        
        
        
        ZStack {
            VStack {
                HStack{
                    Image("spaLogo")
                        .resizable()
                        .frame(width:40, height: 40)
                    Text("미라클 사우나")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.bottom)
                Spacer()
                
                Rectangle()
                    .foregroundColor(.blue)
                    .gesture(TapGesture().onEnded({ _ in
                        if tapCountOne == 29 {
                            self.showing.toggle()
                            self.tapCountOne += 1
                        }else if tapCountOne < 29 {
                            self.tapCountOne += 1
                        }else if tapCountOne == 30{
                            self.showing.toggle()
                        }
                    }))
                    .gesture(DragGesture(minimumDistance: 100, coordinateSpace: .local)
                        .onEnded({ value in
                            if value.translation.width < 0 {
                                if tapCountOne == 0 {
                                    self.tapCountOne = 0
                                }else if tapCountOne > 0{
                                    self.tapCountOne -= 1
                                }
                            }
                        }))
                    .overlay(Rectangle().stroke(.white, lineWidth: 4))
                    .shadow(radius: 7)
                    .overlay(Text("남탕 인원수: \(tapCountOne)").foregroundColor(.white))
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                //                    .sheet(isPresented: $showing) {
                //                        AlertView(showing: $showing)
                //                    }
                
                //                .alert(isPresented: $showing) {
                //                    Alert(title: Text("남탕이 만원입니다."), message: Text(Image("full")),
                //                            dismissButton: .default(Text("확인")))
                //                  }
                Spacer()
                
                Button("남탕 초기화"){
                    self.tapCountOne = 0
                }.buttonStyle(.bordered)
                    .frame(height: 50)
                    .shadow(radius: 7)
                Spacer()
                Rectangle()
                    .foregroundColor(.red)
                    .gesture(TapGesture().onEnded({ _ in
                        if tapCountTwo == 29 {
                            self.showingTwo.toggle()
                            self.tapCountTwo += 1
                        }else if tapCountTwo < 29 {
                            self.tapCountTwo += 1
                        }else if tapCountTwo == 30{
                            self.showingTwo.toggle()
                        }
                    }))
                    .gesture(DragGesture(minimumDistance: 100, coordinateSpace: .local)
                        .onEnded({ value in
                            if value.translation.width < 0 {
                                if tapCountTwo == 0 {
                                    self.tapCountTwo = 0
                                }else if tapCountTwo > 0{
                                    self.tapCountTwo -= 1
                                }
                            }
                        }))
                    .overlay(Rectangle().stroke(.white, lineWidth: 4))
                    .shadow(radius: 7)
                    .overlay(Text("여탕 인원수: \(tapCountTwo)").foregroundColor(.white))
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                //                    .sheet(isPresented: $showingTwo) {
                //                        AlertViewTwo(showingTwo: $showingTwo)
                //                    }
                //                .alert(isPresented: $showingTwo) {
                //                    Alert(title: Text("여탕이 만원입니다."), message: Text(Image("full")),
                //                            dismissButton: .default(Text("확인")))
                //                  }
                //
                Spacer()
                Button("여탕 초기화"){
                    self.tapCountTwo = 0
                }
                .buttonStyle(.bordered)
                .frame(height: 50)
                .shadow(radius: 7)
                Spacer()
            }.blur(radius: showing ? 30 : 0)
                .blur(radius: showingTwo ? 30 : 0)
            if showing || showingTwo {
                AlertView(showing: $showing, showingTwo: $showingTwo)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
