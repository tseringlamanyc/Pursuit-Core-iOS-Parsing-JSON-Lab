//
//  Weather.swift
//  ParingJSONLab
//
//  Created by Tsering Lama on 11/25/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    
    let list: [Weather]
}

struct Weather: Codable {
    
    let name: String
//    let temp: Double
//    let description: String
    
}

extension WeatherData {
    
    static func getWeather() -> [Weather] {
        var arr = [Weather]()
        
        guard let fileURL = Bundle.main.url(forResource: "weather", withExtension: "json") else {
            fatalError()
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            arr = weatherData.list
        } catch {
            fatalError("\(error)")
        }
        return arr
    }
}
