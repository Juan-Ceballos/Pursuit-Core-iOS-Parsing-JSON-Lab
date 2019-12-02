//
//  User.swift
//  Parsing-JSON
//
//  Created by Juan Ceballos on 12/1/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import Foundation

struct UserData: Codable {
    let results: [User]
}

struct User: Codable {
    let name: randomNameWrapper
    let location: locationWrapper
    let email: String
    let dob: dobWrapper
    let phone: String
}

struct randomNameWrapper: Codable   {
    let title: String
    let first: String
    let last: String
}

struct locationWrapper: Codable {
    let street: streetWrapper
    let city: String
    let state: String
    let country: String
    // postcode can be int or string, will learn to implemet generics monday
    // let postcode: Int
}

struct streetWrapper: Codable   {
    let number: Int
    let name: String
}

struct dobWrapper: Codable  {
    let date: String
}

extension UserData  {
    static func getUserData() -> [User] {
        var users = [User]()
        
        guard let sourceURL = Bundle.main.url(forResource: "randomUser", withExtension: "json")
        else    {
            fatalError("parsing data")
        }
        do  {
            let data = try Data(contentsOf: sourceURL)
            let userData = try JSONDecoder().decode(UserData.self, from: data)
            
            users = userData.results
        }
        catch   {
            fatalError("\(error)")
        }
        return users
    }
}
