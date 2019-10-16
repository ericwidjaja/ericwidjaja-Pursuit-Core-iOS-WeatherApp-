//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Eric Widjaja on 10/13/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    //MARK: - Properties
    //to set up weather table view
    var weatherInfo = [DailyData]() {
        didSet {
//            weatherCollectionView.reloadData()
            //to create WeatherCollectionViewCell file
        }
    }
    var layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
