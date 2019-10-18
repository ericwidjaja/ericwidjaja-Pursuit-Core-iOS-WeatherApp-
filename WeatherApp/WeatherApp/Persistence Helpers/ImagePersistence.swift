//
//  ImagePersistence.swift
//  WeatherApp
//
//  Created by Eric Widjaja on 10/17/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

struct ImagePersistenceHelper {
    static let manager = ImagePersistenceHelper()

    func save(newImage: FaveImage) throws {
        try persistenceHelper.save(newElement: newImage)
    }

    func getPhoto() throws -> [FaveImage] {
        return try persistenceHelper.getObjects().sorted(by: {$0.date < $1.date})
    }
    
    func deleteFunction(withID: String) throws {
              do {
                  let photos = try getPhoto()
               let newPhotos = photos.filter { $0.addedDate != withID }
                  try persistenceHelper.replace(elements: newPhotos)
              }
          }
    
    func replaceArray(favoritesArray:[FaveImage]) throws {
        try persistenceHelper.replace(elements: favoritesArray)
    }

    private let persistenceHelper = PersistenceHelper<FaveImage>(fileName: "image.plist")

    private init() {}
}
