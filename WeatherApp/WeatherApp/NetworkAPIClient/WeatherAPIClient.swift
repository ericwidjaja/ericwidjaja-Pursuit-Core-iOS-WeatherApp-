//
//  WeatherAPIClient.swift
//  WeatherApp
//
//  Created by Eric Widjaja on 10/13/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import Foundation
import UIKit

class WeatherAPIClient {
    //shared = manager
    static let shared = WeatherAPIClient ()
    
    func getWeather(latLong:String, completionHandler:@escaping(Result<[DailyData],AppError>) -> Void) {
        let url = "https://api.darksky.net/forecast/\(SecretAPIKeys.darkSkyKey)/\(latLong)"
       
        guard let urlString = URL(string:url) else {
           completionHandler(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: urlString, andMethod: .get) {
            (results) in
            DispatchQueue.main.async {
                switch results {
                case .failure(let error):
                    completionHandler(.failure(error))
                case.success(let data):
                    do { let weatherData = try JSONDecoder().decode(DarkSkyWeather.self, from: data)
                        completionHandler(.success(weatherData.daily.data))
                    } catch{
        completionHandler(.failure(.invalidJSONResponse))
                    }
                }
            }
        }
    }
    
}
