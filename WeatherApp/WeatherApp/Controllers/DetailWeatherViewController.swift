//
//  DetailWeatherViewController.swift
//  WeatherApp
//
//  Created by Eric Widjaja on 10/12/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//
import Foundation
import UIKit

class DetailWeatherViewController: UIViewController {
    
        var nameOfTheCity: String! {
            didSet {
                loadData()
        }
        }
        var passingDailyData:DailyDatum!

        
      lazy  var cityImage:UIImageView = {
            let city = UIImageView()
        city.contentMode = .scaleAspectFit
        
        
            return city
        }()
        
        lazy var placeholderActivity:UIImageView = {
            
            let image = UIImageView()
            return image
            
        }()
        
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    private func loadData() {
    //To create PictureAPIClient.swift file
        
//        PictureAPIClient.shared.getPictures(searchTerm:nameOfTheCity!) {
//            (results) in
//            DispatchQueue.main.async {
//                switch results {
//                case .failure(let error):
//                    print(error)
//                case .success(let data):
//                    self.pictureData = data
//
//                }
//            }
//        }
    }
}

