//
//  FaveImage.swift
//  WeatherApp
//
//  Created by Eric Widjaja on 10/12/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

struct FaveImage: Codable {
    let addedDate: String
    let imageData: Data
    
    public var date: Date {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = Date()
        if let date = isoDateFormatter.date(from: addedDate) {
            formattedDate = date
        }
        return formattedDate
    }
}
