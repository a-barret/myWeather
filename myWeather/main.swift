//
//  main.swift
//  myWeather
//
//  Created by Aiden Barrett on 4/30/25.
//
//

import Foundation

func getUnitPreference() -> String {
    print("Select IMPERIAL units (Fahrenheit and Miles per hour) or METRIC units (Celsius and Kilometers per hour) (IMPERIAL/METRIC): ", terminator: "")
    // If the user enters nothing then it will default to imperial
    guard let preference = readLine()?.lowercased(), !preference.isEmpty else {
        print("Unknown response. Imperial selected by default")
        return "imperial"
    }
    
    // If the user enters something other than imperial or metric, it defaults to imperial.
    if preference != "imperial" && preference != "metric" {
        print("Unknown response. Imperial selected by default")
        return "imperial"
    }
    
    return preference.lowercased()
}

func getMenuChoice() -> Int {
    while true {
        print("Enter your choice (0-2): ", terminator: "")
        // Handles if the user enters a blank input.
        guard let input = readLine(), !input.isEmpty else {
            print("Invalid input. Please try again.")
            continue
        }
        
        // Checks if the input is a integer
        if let choice = Int(input) {
            return choice
        } else {
            print("Please enter a valid number. Please try again.")
        }
    }
}

func getLocation() -> String {
    print("Enter a city name for weather: ", terminator: "")
    guard let location = readLine() else {
        return ""
    }
    return location
}

func main() async {
    var unitPreference = getUnitPreference()
    var speedUnits = ""
    var tempUnits = ""
    if unitPreference == "imperial" {
        speedUnits = "mph"
        tempUnits = "F"
    } else {
        speedUnits = "km/h"
        tempUnits = "C"
    }
    // Changes the units sent in the weather api request
    let weatherService = WeatherService()
    weatherService.SetUnitPreference(unitType: unitPreference)
    
    var menuChoice = 1
    
    while menuChoice != 0 {
        print("")
        print("Select a menu option:")
        print("0. Quit")
        print("1. Get weather for a location")
        print("2. Change unit preference")
        menuChoice = getMenuChoice()
        
        switch menuChoice {
        case 0:
            print("")
            break
        case 1:
            let location = Location(name: getLocation())
            
            do {
                let weather = try await weatherService.fetchWeather(for: location)
                location.currentWeather = weather
                
                print("")
                print("Weather in \(location.name.capitalized):")
                print("Temperature: \(weather.temperature)°\(tempUnits)")
                print("Humidity: \(weather.humidity)%")
                print("Wind Speed: \(weather.windSpeed) \(speedUnits)")
                print("Condition: \(weather.condition.capitalized)")
                print("")
                print("Press enter when done...", terminator: "")
                _ = readLine()
            } catch {
                print("Error: \(error.localizedDescription)")
            }
            break
        case 2:
            unitPreference = getUnitPreference()
            if unitPreference == "imperial" {
                speedUnits = "mph"
                tempUnits = "F"
            } else {
                speedUnits = "km/h"
                tempUnits = "C"
            }
            weatherService.SetUnitPreference(unitType: unitPreference)
            break
        default:
            print("Invalid Choice. Please select 0, 1, or 2.")
        }
    }
}

await main()
