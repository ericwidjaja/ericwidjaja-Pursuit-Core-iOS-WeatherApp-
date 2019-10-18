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

    static func getForecastFromData(data: Data) throws -> [DailyDatum]? {
        do {
            let info = try JSONDecoder().decode(DarkSkyWeather.self, from: data)
            return info.daily.data
    
        } catch {
            print(error)
            return nil
        }
    }
}
// MARK: - Daily
struct Daily: Codable {
    let summary: String?
    let data: [DailyDatum]?
}

// MARK: - DailyDatum
struct DailyDatum: Codable {
    let time: Int?
    let icon: String?
    let summary: String?
    let sunriseTime, sunsetTime: Int
    let moonPhase, precipIntensity, precipIntensityMax: Double?
    let precipIntensityMaxTime: Int?
    let precipProbability: Double?
    let temperatureHigh: Double
    let temperatureHighTime: Int?
    let temperatureLow: Double
    let temperatureLowTime: Int?
    let apparentTemperatureHigh: Double?
    let apparentTemperatureHighTime: Int?
    let apparentTemperatureLow: Double?
    let apparentTemperatureLowTime: Int?
    let dewPoint, humidity, pressure, windSpeed: Double?
    let windGust: Double?
    let windGustTime, windBearing: Int?
    let cloudCover: Double?
    let uvIndex, uvIndexTime: Int?
    let visibility, ozone, temperatureMin: Double?
    let temperatureMinTime: Int?
    let temperatureMax: Double?
    let temperatureMaxTime: Int?
    let apparentTemperatureMin: Double?
    let apparentTemperatureMinTime: Int?
    let apparentTemperatureMax: Double?
    let apparentTemperatureMaxTime: Int?

    func getDateFromTime(time:Int) -> String {

        let date = NSDate(timeIntervalSince1970: TimeInterval(time))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        let testDate = dateFormatter.string(from: date as Date)
        
        return testDate.components(separatedBy: " at")[0]
    }

    func getSpecificTimeFromTime(time:Int) -> String {

        let date = NSDate(timeIntervalSince1970: TimeInterval(time))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        let testDate = dateFormatter.string(from: date as Date)
        
        return testDate.components(separatedBy: " at")[1]
    }
}
