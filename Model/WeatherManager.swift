//
//  WeatherManager.swift
//  Clima
//
//  Created by Florian Dreyer on 04.05.21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "" // insert your own api key
    // get weather data
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    // perform request
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                  let weather = self.parseJSON(weatherData: safeData)
                }
            task.resume()
        }
        
    }

    }
    // get data from JSON file
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
        let decodedData =  try decoder.decode(WeatherData.self, from: weatherData)
        let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(condition: id, cityName: name, temperature: temp)
            return weather
        } catch {
            print(error)
            return nil
        }
    }
    // weatherId to description
    func getConditionName(weatherId: Int) -> String{
        switch weatherId {
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
