//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Eric Widjaja on 10/13/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    //MARK: - Properties & Outlets
    
    var forecast = [DailyDatum]() {
        didSet {
            forecastCollectionView.reloadData()
        }
    }
    
    //MARK: - Outlets
    
    var userZIP = ""
    
    @IBOutlet weak var enterZIpLabel: UILabel!
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var forecastCollectionView: UICollectionView!
    
    @IBOutlet weak var zipCodeInputField: UITextField!
    
    
    
    override func viewDidLoad() {
        forecastCollectionView.delegate = self
        forecastCollectionView.dataSource = self
        zipCodeInputField.delegate = self
        super.viewDidLoad()
    }
    
    private func loadForecast(lat: Double, long: Double){
        WeatherAPIClient.shared.getWeatherFrom(lat: lat, long: long) { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let data):
                        self.forecast = data
                    }
                }
            }
        }
    
   private func loadData(zip: String){
        ZipCodeHelper.getLatLong(fromZipCode: zip) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                    self.enterZIpLabel.text = "Invalid ZIP, Try Again:"
                case .success(let lat, let long, let name):
                    self.loadForecast(lat: lat, long: long)
                    self.cityNameLabel.text = name
                    self.enterZIpLabel.text = "Enter Zipcode:"
                   
                }
            }
        }
    }
   
}
    
extension WeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = forecastCollectionView.dequeueReusableCell(withReuseIdentifier: "forecastCell", for: indexPath) as? ForecastCollectionViewCell else { return UICollectionViewCell()}
        let weather = forecast[indexPath.row]
        
        cell.dateLabel.text = weather.getDateFromTime(time: weather.time ?? 3)
        cell.imageWeather.image = UIImage(named: "\(weather.icon! )")
        cell.forecastSummaryLabel.text = weather.summary
        cell.highLabel.text = "High:   \(weather.temperatureHigh ?? 0.0)"
        cell.lowLabel.text = "Low :   \(weather.temperatureLow ?? 0.0)"
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 400, height: 407)
        }
}
        //resent detail VCto build the collectionView func ---> modally present detailForecast VC


        //MARK: TextField Extension
extension WeatherViewController: UITextFieldDelegate {
    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if zipCodeInputField.text?.count == 5 {
                zipCodeInputField.resignFirstResponder()
                loadData(zip: zipCodeInputField.text ?? "90210")
                
        return true
        } else {
        return false
        }
    }
}

