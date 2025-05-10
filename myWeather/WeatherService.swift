//
//  WeatherService.swift
//  myWeather
//
//  Created by Aiden Barrett on 5/8/25.
//

import Foundation

class WeatherService {
    private let apiKey = "d23393088a0ac2a3124badfe8fa0e30a"
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    
    enum WeatherError: Error {
        case requestFailed(String)
    }
    
    func fetchWeather(for location: Location) async throws -> WeatherData {
        let query = "q=\(location.name)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: "\(baseURL)?\(query)") else {
            throw WeatherError.requestFailed("Invalid URL")
        }
        
        // Fetch data
        let (data, response) = try await URLSession.shared.data(from: url)
                
        // Check response
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw WeatherError.requestFailed("Invalid response or city not found")
        }
        
        // Parse JSON
        let responseData = try JSONDecoder().decode(WeatherResponse.self, from: data)
        
        // Map to WeatherData
        return WeatherData(
            temperature: responseData.main.temp,
            humidity: responseData.main.humidity,
            windSpeed: responseData.wind.speed,
            condition: responseData.weather.first?.description ?? "Unknown"
        )
    }
}
