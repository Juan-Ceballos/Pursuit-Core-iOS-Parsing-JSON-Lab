//
//  DetailedWeatherController.swift
//  Parsing-JSON
//
//  Created by Juan Ceballos on 11/28/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import UIKit

class DetailedWeatherController: UIViewController {

    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    var cityWeather: CityWeather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let cityWeather = cityWeather
            else    {
                fatalError()
        }
        currentTemperatureLabel.text = "Temperature: \(cityWeather.main.temp) °C"
        weatherLabel.text = "Weather: \(cityWeather.weather[0].description)"
    }
}
