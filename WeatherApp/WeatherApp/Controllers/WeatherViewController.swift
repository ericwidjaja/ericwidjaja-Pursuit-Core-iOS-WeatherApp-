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
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var forecastCollectionView: UICollectionView!
    
    @IBOutlet weak var zipCodeInputLabel: UILabel!
    
    
    @IBOutlet weak var zipCodeInputField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
