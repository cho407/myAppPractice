//
//  ArcTest.swift
//  MiracleLottery
//
//  Created by Martin on 2022/10/23.
//

import SwiftUI

struct Arc: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 160.0, y: 160.0))
            path.addArc(center: CGPoint(x:160, y: 160), radius: 150, startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: 90.0), clockwise: false)
        }
    }
}


struct Arc_Preivews: PreviewProvider {
    static var previews : some View {
        Arc()
    }
}
