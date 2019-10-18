//
//  PictureAPIClient.swift
//  WeatherApp
//
//  Created by Eric Widjaja on 10/17/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//


import Foundation
import UIKit

struct PictureAPIClient {
    private init() {}
    static let shared = PictureAPIClient()
    
    func getPictures(search: String, completionHandler: @escaping (Result<PixabayPicture, AppError>) -> ()) {
        let name = search.replacingOccurrences(of: " ", with: "+").lowercased()
        let urlStr = "https://pixabay.com/api/?key=\(SecretAPIKeys.pixaBayKey)&q=\(name)&image_type=photo&pretty=true"
//        let urlStr = "https://pixabay.com/api/?key=13951722-70ec27a49b8dad8d3243dc6fa&q=los+angeles&image_type=photo&pretty=true"
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
                    let photos = try PixabayPicture.getPicture(data: data)
                    completionHandler(.success(photos))
                }
                catch {
                    completionHandler(.failure(.other(rawError: error)))
                }
            }
        }
    }
    
}


//class PictureAPIClient {
//    static let shared = PictureAPIClient()
//
//    func getPhotos(search: String, completionHandler: @escaping (Result<Photos, AppError>) -> ()) {
//    let name = search.replacingOccurrences(of: " ", with: "+").lowercased()
//    let urlStr = "https://pixabay.com/api/?key=\(Secrets.pix_key)&q=\(name)&image_type=photo&pretty=true"
//
//    func getPictures(searchTerm: String, completionHandler: @escaping (Result<[Hit],AppError>) -> Void) {
//        let urlString = "https://pixabay.com/api/?key=\(SecretAPIKeys.pixaBayKey)&q=\(name)&image_type=photo&pretty=true"
//        guard let url  = URL(string: urlString) else {
//            completionHandler(.failure(.badURL))
//            return
//        }
//
//        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (results) in
//            switch results {
//            case .failure(let error):
//                completionHandler(.failure(error))
//            case .success(let URLisWorking):
//                do { let decoded = try JSONDecoder().decode(PixabayPicture.self, from: URLisWorking)
//
//                    completionHandler(.success(decoded.hits))
//                } catch {
//                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
//                }
//            }
//        }
//    }
//}
