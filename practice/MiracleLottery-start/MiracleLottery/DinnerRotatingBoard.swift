//
//  DinnerRotatingBoard.swift
//  MiracleLottery
//
//  Created by 김예원 on 2022/10/24.
//

import SwiftUI

struct DinnerRotatingBoard: View {
    
    @ObservedObject var menuData: MenuData
//    var userNumber: Int = menuData.userNumber
//    var rotation: Int = menuData.rotation
//    var opacity: CGFloat = menuData.resultTextOpacity
    
    var color: [Color] = [
        .red, .yellow, .gray, .blue, .pink, .purple, .brown, .indigo, .green, .orange, .teal
    ]
    
    var body: some View {
        GeometryReader { geo in
            let centerWidth: CGFloat = geo.size.width / 2
            let centerHeight: CGFloat = geo.size.height / 2
            ZStack {
                Circle()
                    .frame(width: 320, height: 320)
                ForEach(1 ..< menuData.userNumber + 1) { index in
                    let eachArcStartAngle: Double = Double(360 / menuData.userNumber * (index - 1))
                    let eachArcEndAngle: Double = Double(360 / menuData.userNumber * (index))
                    let middleAngle: Double = (eachArcStartAngle + eachArcEndAngle) / 2
                    
                    
                    Path { path in
                        path.move(to: CGPoint(x: centerWidth, y: centerHeight))
                        path.addArc(center: .init(x: centerWidth, y: centerHeight),
                                    radius: 150,
                                    startAngle: Angle(degrees: eachArcStartAngle),
                                    endAngle: Angle(degrees: eachArcEndAngle),
                                    clockwise: false)
                    }
                    .fill(color[index - 1])
                    .overlay {
                        Text(menuData.lunchMenus[index - 1])
                            .offset(x: 100 * cos(middleAngle * Double.pi / 180),
                                    y: 100 * sin(middleAngle * Double.pi / 180))
                        
                    }
                }
                .rotationEffect(.degrees(Double(self.menuData.rotation)))
                .animation(.timingCurve(0, 0.8, 0.2, 1, duration:10), value: menuData.rotation)
                
                
                Image(systemName: "arrowtriangle.down.fill")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width:30.0, height: 30.0)
                    .offset(x: 0, y: -175)
                    .foregroundColor(.red)
                
                Rectangle()
                    .frame(width:100, height:40)
                    .foregroundColor(.white)
                    .overlay() {
                        let index: Int = menuData.getCurrentIndex()
                        
                        Text(menuData.lunchMenus[index])
                            .opacity(menuData.resultTextOpacity)
                        
                    }
            }
        }
    }
    private func concatenate(_ lhs: String, _ rhs: String) -> String {
            return lhs + rhs
        }

}

