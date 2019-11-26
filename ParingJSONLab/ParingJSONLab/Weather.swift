//
//  Weather.swift
//  ParingJSONLab
//
//  Created by Tsering Lama on 11/25/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    
    let arrWeather: [Weather]
}

struct Weather: Codable {
    
    let name: String
    let temp: Double
    let description: String
    
}

extension WeatherData {
    
    static func 
}
