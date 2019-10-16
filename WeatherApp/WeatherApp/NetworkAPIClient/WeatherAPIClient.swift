//
//  WeatherAPIClient.swift
//  WeatherApp
//
//  Created by Eric Widjaja on 10/13/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import Foundation
import UIKit

struct WeatherAPIClient {
    private init() {}
        static let shared = WeatherAPIClient()
        
        func getWeatherFrom(lat: Double, long: Double, completionHandler: @escaping (Result<[DailyDatum], AppError>) -> ()) {
            let urlStr = "https://api.darksky.net/forecast/\(SecretAPIKeys.darkSkyKey)/\(lat),\(long)"
            guard let url = URL(string: urlStr) else {
                completionHandler(.failure(AppError.badURL))
                return
            }
            NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
                switch result {
                case .failure(let error):
                    completionHandler(.failure(.other(rawError: error)))
                case .success(let data):
                    
                    do {
                    let forecast = try DarkSkyWeather.getForecastFromData(data: data)
                        completionHandler(.success(forecast!))
                    }
                    catch {
                        completionHandler(.failure(.other(rawError: error)))
                    }
                }
            }
        }
        
    }
