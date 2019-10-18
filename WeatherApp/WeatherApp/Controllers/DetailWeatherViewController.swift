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
    
    var weatherDailyData: DailyDatum!
    
    lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = label.font.withSize(30)
        return label
    }()
    
    lazy var highTempLabel: UILabel = {
        let label = UILabel()
        label.text = "High : \(weatherDailyData.temperatureHigh)"
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(16)
        return label
    }()
    
    lazy var lowTempLabel: UILabel = {
        let label = UILabel()
        label.text = "Low: \(weatherDailyData.temperatureLow)"
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(16)
        return label
    }()
    
    lazy var sunriseLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunrise: \(weatherDailyData.getSpecificTimeFromTime(time: weatherDailyData.sunriseTime))"
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(16)
        return label
    }()
    
    lazy var sunsetLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunset: \(weatherDailyData.getSpecificTimeFromTime(time: weatherDailyData.sunsetTime))"
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(16)
        return label
    }()
    
    lazy var weatherIcon: UIImageView = {
        let icon = UIImageView()
        icon.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return icon
    }()
    
    lazy var windSpeedLabel: UILabel = {
        let label = UILabel()
        label.text = "Windspeed: \(weatherDailyData.windSpeed ?? 0) "
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(16)
        return label
    }()
    
    lazy var precipLabel: UILabel = {
        let label = UILabel()
        label.text = "Chance of precipitation: \(weatherDailyData.precipProbability ?? 0)%"
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(16)
        return label
    }()
    
    lazy var detailInfoStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [cityNameLabel, highTempLabel, lowTempLabel, sunriseLabel, sunsetLabel, precipLabel])
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = CGFloat(3)
        stack.distribution = .equalSpacing
        return stack
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.backgroundColor = UIColor.link
        button.addTarget(self, action: #selector(backButtonPressed(sender:)), for: .touchUpInside)
        
        return button
    }()
    
    private func backButtonConstrain(){
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0),
            backButton.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier: 0),
            backButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -400)
        ])
    }
    private func constrainStack(){
        detailInfoStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailInfoStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            detailInfoStack.centerYAnchor.constraint(equalTo:self.view.centerYAnchor, constant: 150),
            detailInfoStack.heightAnchor.constraint(equalToConstant: 200),
            detailInfoStack.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0)
        ])
    }
    
    //MARK: - Methods(in obj-C)
    @objc func backButtonPressed(sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
    private func setUpConstraints(){
        backButtonConstrain()
        constrainStack()
    }
    private func addSubviews(){
        view.addSubview(cityNameLabel)
        view.addSubview(backButton)
        view.addSubview(weatherIcon)
        view.addSubview(detailInfoStack)
    }
    
    
    override func viewDidLoad() {
        setNeedsStatusBarAppearanceUpdate()
        addSubviews()
        setUpConstraints()
        self.view.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        super.viewDidLoad()
    }
}
