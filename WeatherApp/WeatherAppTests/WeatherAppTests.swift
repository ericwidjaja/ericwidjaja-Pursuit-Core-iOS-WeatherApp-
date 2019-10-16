//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Eric Widjaja on 10/12/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import XCTest
@testable import WeatherApp


class WeatherAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testDarkSkyWeatherModel() {
        guard let path = Bundle.main.path(forResource: "DarkSkyWeather", ofType: "json") else { return }
        
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            
            let testWeather = try DarkSkyWeather.getForecastFromData(data: data) ?? []
            print(testWeather.count)
            XCTAssert(testWeather.count > 0, "We have \(testWeather.count) listings")
        } catch {
            print(error)
            XCTFail()
        }
    }
}
