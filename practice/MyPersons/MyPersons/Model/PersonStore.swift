//
//  PersonStore.swift
//  MyPersons
//
//  Created by Jongwook Park on 2022/11/30.
//

import Foundation

class PersonStore: ObservableObject {
    
    @Published var persons: [Person]
    
    init(persons: [Person] = []) {
        self.persons = persons
    }
}
