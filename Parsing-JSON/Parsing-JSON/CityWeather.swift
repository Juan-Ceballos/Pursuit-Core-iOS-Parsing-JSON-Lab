//
//  CityWeathers.swift
//  Parsing-JSON
//
//  Created by Juan Ceballos on 11/28/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import Foundation

enum JSONError: Error {
    case decodingError(Error)
}

struct CityWeatherData: Codable {
    let list: [CityWeather]
}

struct CityWeather: Codable {
    let name: String
    
    // need wrapper so custom type with struct, main has temp can custom name with codingkeys since want temperature reather than main
    let main: tempWrapper
    
    let weather: [weatherWrapper] // same kindof object of key value in array
    
}

struct tempWrapper: Codable {
    let temp: Double
}

struct weatherWrapper: Codable   {
    let description: String
}

extension CityWeatherData   {
    static func getCityWeathers() -> [CityWeather]    {
        var cityWeathers = [CityWeather]()
        
        guard let pathToData = Bundle.main.url(forResource: "weather", withExtension: "json") else    {
            fatalError("load data")
        }
                
        do  {
            let data = try Data(contentsOf: pathToData)
            let cityWeathersData = try JSONDecoder().decode(CityWeatherData.self, from: data)

            cityWeathers = cityWeathersData.list
        }
        catch   {
            fatalError("\(error)")
        }
            return cityWeathers
    }
}
