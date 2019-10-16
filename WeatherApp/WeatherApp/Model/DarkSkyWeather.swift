//
//  DarkSkyWeather.swift
//  WeatherApp
//
//  Created by Eric Widjaja on 10/12/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import Foundation
import UIKit
// MARK: - Weather Model
struct DarkSkyWeather: Codable {
    let timezone: String
    let daily: Daily
    
    static func getForecastFromData(data: Data) throws -> DarkSkyWeather? {
        do {
            let info = try JSONDecoder().decode(DarkSkyWeather.self, from: data)
            return info
    
        } catch {
            print(error)
            return nil
        }
    
    }
}

enum Icon: String, Codable {
    case cloudy = "cloudy"
    case partlyCloudyNight = "partly-cloudy-night"
    case rain = "rain"
}

// MARK: - Daily
struct Daily: Codable {
    let summary: String
    let icon: Icon
    let data: [DailyData]
}

// MARK: - DailyData
struct DailyData: Codable {
    let time: Int
    let summary, icon: String
    let sunriseTime, sunsetTime: Int
    let precipIntensity:Double
    let precipProbability: Double
    let precipType: Icon?
    let temperatureHigh: Double
    let temperatureLow: Double
    let windSpeed: Double
    let temperatureMinTime: Int
    let temperatureMax: Double
    let temperatureMaxTime: Int
}

