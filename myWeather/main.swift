//
//  main.swift
//  myWeather
//
//  Created by Aiden Barrett on 4/30/25.
//

import Foundation

func main() async {
    let weatherService = WeatherService()
    let location = Location(name: "Calgary")
    
    do {
        let weather = try await weatherService.fetchWeather(for: location)
        location.currentWeather = weather
        print("Weather in \(location.name):")
        print("Temperature: \(weather.temperature)°C")
        print("Humidity: \(weather.humidity)%")
        print("Wind Speed: \(weather.windSpeed) km/h")
        print("Condition: \(weather.condition)")
    } catch {
        print("Error: \(error.localizedDescription)")
    }
}

await main()
