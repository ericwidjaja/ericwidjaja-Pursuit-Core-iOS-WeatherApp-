//
//  Picture.swift
//  WeatherApp
//
//  Created by Eric Widjaja on 10/17/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//
import Foundation
import UIKit
// MARK: - Picture
struct Picture: Codable {
    let totalHits: Int
    let hits: [Hit]
    let total: Int
}

// MARK: - Hit
struct Hit: Codable {
    let largeImageURL: String?
    let webformatHeight, webformatWidth, likes, imageWidth: Int?
    let id, userID, views, comments: Int?
    let pageURL: String?
    let imageHeight: Int?
    let webformatURL: String?
    let previewHeight: Int?
    let tags: String?
    let downloads: Int?
    let user: String?
    let favorites, imageSize, previewWidth: Int?
    let userImageURL: String?
    let previewURL: String?
    
    enum CodingKeys: String, CodingKey {
        case largeImageURL, webformatHeight, webformatWidth, likes, imageWidth, id
        case userID = "user_id"
        case views, comments, pageURL, imageHeight, webformatURL, previewHeight, tags, downloads, user, favorites, imageSize, previewWidth, userImageURL, previewURL
    }
}

