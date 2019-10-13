//
//  DarkSkyWeather.swift
//  WeatherApp
//
//  Created by Eric Widjaja on 10/12/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation
import UIKit
// MARK: - Weather Model
struct DarkSkyWeather: Codable {
    let timezone: String
    let daily: Daily
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
    let data: [DailyDatum]
}

// MARK: - DailyDatum
struct DailyDatum: Codable {
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
//need to change time with date formatter
