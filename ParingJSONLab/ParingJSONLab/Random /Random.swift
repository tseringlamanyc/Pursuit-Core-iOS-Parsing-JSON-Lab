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
    
    let name: [String: String] 
    let email: String
    let phone: String
    let dob: BirthDate
    let location: Locations
    let picture: MultiMedia
}

struct BirthDate: Codable{
    var date: String
}

struct Locations: Codable {
    var street: FirstAddress
    var city: String
    var state: String
    var country: String
}

struct FirstAddress: Codable{
    var number: Int
    var name: String
}

struct MultiMedia: Codable {
    var large: String
    
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
            fatalError("\(error)")
        }
        
        return arr
    }
    
}
