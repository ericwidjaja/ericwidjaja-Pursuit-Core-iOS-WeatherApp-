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
    
    var picture = "City Pictures Are Not Loading"
    
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
        stack.spacing = CGFloat(5)
        stack.distribution = .equalSpacing
        return stack
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        button.addTarget(self, action: #selector(backButtonPressed(sender:)), for: .touchUpInside)
        
        return button
    }()

    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("SAVE", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        button.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private func backButtonConstraints(){
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0),
            backButton.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier: 0),
            backButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -400)
        ])
    }
    
    private func stackConstraints(){
        detailInfoStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailInfoStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            detailInfoStack.centerYAnchor.constraint(equalTo:self.view.centerYAnchor, constant: 150),
            detailInfoStack.heightAnchor.constraint(equalToConstant: 200),
            detailInfoStack.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0)
        ])
    }
    
    private func iconConstraints(){
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherIcon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            weatherIcon.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -190),
            weatherIcon.heightAnchor.constraint(equalToConstant: 365),
            weatherIcon.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
    }
    
    private func saveButtonConstraints(){
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0),
            saveButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            saveButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 375)
        ])
    }
    
    private func loadPicture(name: String){
        PictureAPIClient.shared.getPictures(search: name) {(result) in DispatchQueue.main.async {
            switch result {
            case .success(let PixabayPicture):
                self.picture = PixabayPicture.hits[0] .largeImageURL
                print(self.picture)
                ImageHelper.shared.getImage(urlStr: self.picture) { (result) in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let pic):
                            self.weatherIcon.image = pic
                        case .failure(let error):
                            print(error)
                            print(self.picture)
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
            }
        }
    }
    //MARK: - Methods(in obj-C)
    @objc func backButtonPressed(sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func saveButtonPressed() {
        let icon = weatherIcon.image?.pngData()
        let favoritedPict = FavePict(image: icon!, name: cityNameLabel.text!)
        do {
            try
            PicturePersistenceHelper.manager.save(newPhoto: favoritedPict)
            dismiss(animated: true, completion: nil)
        } catch {
            return
        }
        
    }
    
    private func setUpConstraints(){
        backButtonConstraints()
        stackConstraints()
        iconConstraints()
        saveButtonConstraints()
    }
    private func addSubviews(){
        view.addSubview(cityNameLabel)
        view.addSubview(backButton)
        view.addSubview(weatherIcon)
        view.addSubview(detailInfoStack)
        view.addSubview(saveButton)
    }
    
    override func viewDidLoad() {
        setNeedsStatusBarAppearanceUpdate()
        addSubviews()
        setUpConstraints()
        loadPicture(name: cityNameLabel.text!)
        self.view.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        super.viewDidLoad()
    }
}
