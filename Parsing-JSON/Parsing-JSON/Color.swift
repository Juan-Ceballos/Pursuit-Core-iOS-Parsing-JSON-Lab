//
//  Color.swift
//  Parsing-JSON
//
//  Created by Juan Ceballos on 12/1/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import Foundation

struct ColorData: Codable   {
    let colors: [Color]
}

struct Color: Codable    {
    let hex: hexWrapper
    let name: nameWrapper
    let rgb: rGBWrapper
}

struct hexWrapper: Codable  {
    let value: String
}

struct nameWrapper: Codable {
    let value: String
}

struct  rGBWrapper: Codable {
    let fraction: fractionWrapper
    let value: String
}

struct fractionWrapper: Codable {
    let r: Double
    let g: Double
    let b: Double
}

extension ColorData {
    static func getColors() -> [Color] {
        var colors = [Color]()
        
        guard let sourceURL = Bundle.main.url(forResource: "color", withExtension: "json")
            else    {
                fatalError("Load json")
        }
        do  {
            let data = try Data(contentsOf: sourceURL)
            let colorData = try JSONDecoder().decode(ColorData.self, from: data)
            
            colors = colorData.colors
        }
        catch   {
            fatalError("\(error)")
        }
        return colors
    }
}
