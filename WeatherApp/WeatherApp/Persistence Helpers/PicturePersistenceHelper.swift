//
//  PicturePersistenceHelper.swift
//  WeatherApp
//
//  Created by Eric Widjaja on 10/20/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation
struct PicturePersistenceHelper {
    
    private static var pictures = [FavePict]()
    
    static let manager = PicturePersistenceHelper()

    func save(newPhoto: FavePict) throws {
        try persistenceHelper.save(newElement: newPhoto)
    }

    func getPhoto() throws -> [FavePict] {
        return try persistenceHelper.getObjects()
    }

    func delete(picArray: [FavePict], index: Int) throws {
        return try persistenceHelper.deleteAtIndex(newArray: picArray, index: index)
        
}

    
    private let persistenceHelper = PersistenceHelper<FavePict>(fileName: "forecastPictures.plist")

    private init() {}
}

