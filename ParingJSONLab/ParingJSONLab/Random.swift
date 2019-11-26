//
//  Random.swift
//  ParingJSONLab
//
//  Created by Tsering Lama on 11/25/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import Foundation

struct PersonData: Codable {
    
    let results: [Person]
    
}

struct Person: Codable {
    
    let email: String
    let name: String
    
}

extension PersonData {
    
    static func getPerson() -> [Person] {
        var arr = [Person]()
        
        guard let fileURL = Bundle.main.url(forResource: "random", withExtension: "json") else {
            fatalError()
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let personData = try JSONDecoder().decode(PersonData.self, from: data)
            arr = personData.results
        } catch {
            fatalError()
        }
        
        return arr
    }
    
}
