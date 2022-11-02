//
//  Car.swift
//  Chapter26Practice
//
//  Created by 조형구 on 2022/10/25.
//

import SwiftUI

struct Car : Codable, Identifiable {
    var id : String
    var name: String
    
    var description: String
    var isHybrid: Bool
    
    var imageName: String
}


