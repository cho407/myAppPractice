//
//  CarStore.swift
//  Chapter26Practice
//
//  Created by 조형구 on 2022/10/25.
//

import Foundation
import Combine


class CarStore : ObservableObject {
    
    @Published var cars: [Car]
    
    init (cars: [Car] = []){
        self.cars = cars
    }
}
