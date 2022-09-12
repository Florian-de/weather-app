//
//  WeatherModel.swift
//  Clima
//
//  Created by Florian Dreyer on 07.05.21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
class WeatherModel {
    
    let condition: Int
    let cityName: String
    let temperature: Double
    
    init(condition: Int, cityName: String, temperature: Double) {
        self.condition = condition
        self.cityName = cityName
        self.temperature = temperature
    }
    
    func updateWeatherIcon(condition: Int) -> String {
        switch condition {
                case 200...232:
                    return "cloud.bolt"
                case 300...321:
                    return "cloud.drizzle"
                case 500...531:
                    return "cloud.rain"
                case 600...622:
                    return "cloud.snow"
                case 701...781:
                    return "cloud.fog"
                case 800:
                    return "sun.max"
                case 801...804:
                    return "cloud.bolt"
                default:
                    return "cloud"
                }
    }
}
