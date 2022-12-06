//
//  WebService.swift
//  MyPersons
//
//  Created by Jongwook Park on 2022/11/30.
//

import Foundation

struct WebService {
    func fetchData(url: String) async throws -> [Person] {
        guard let url = URL(string: url) else {
            return []   // 원래 Error 발생으로 해야 맞음
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let persons = try JSONDecoder().decode([Person].self, from: data)
        
        return persons
    }
}
