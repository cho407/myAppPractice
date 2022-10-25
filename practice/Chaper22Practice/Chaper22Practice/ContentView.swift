//
//  ContentView.swift
//  Chaper22Practice
//
//  Created by 조형구 on 2022/10/19.
//

import SwiftUI

struct ContentView: View {
    var colors: [Color] = [.black, .red, .green, .blue]
    var colornames = ["black", "red", "green", "blue",]
    
    @State private var animationAmount = 0.0
    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var text: String = "Welcome to SwiftUI"
    var body: some View {
        VStack {
            Spacer()
            Text(text)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotation3DEffect(
                            .degrees(animationAmount),
                            axis: (x: 0.0, y: 1.0, z: 0.0))
                .animation(.easeInOut(duration: 5), value: text)
                .foregroundColor(self.colors[self.colorIndex])
            Spacer()
            Divider()
            Slider(value: $animationAmount, in:0...360, step:0.1)
                .padding()
            
            TextField("Eenter text here", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Picker(selection: $colorIndex, label: Text("color")) {
                ForEach ( 0 ..< colornames.count ) {
                    Text(self.colornames[$0])
                        .foregroundColor(self.colors[$0])
                }
            }
            .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
