//
//  Color.swift
//  ParingJSONLab
//
//  Created by Tsering Lama on 11/25/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import Foundation

struct ColorData: Codable {
    
    let colors: [Color]
    
}

struct Color: Codable {
    
    let hex: [String: String]
    let name: [String: String]
    
}

extension ColorData {
    
    static func getColors() -> [Color] {
        var arr = [Color]()
        
        guard let fileURL = Bundle.main.url(forResource: "color", withExtension: "json") else {
            fatalError()
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let colorData = try JSONDecoder().decode(ColorData.self, from: data)
            arr = colorData.colors
        } catch {
            fatalError("\(error)")
        }
        return arr
    }
    
}
