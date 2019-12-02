//
//  ViewController.swift
//  Parsing-JSON
//
//  Created by Juan Ceballos on 11/27/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import UIKit

class DetailedUserController: UIViewController {

    @IBOutlet weak var fullAddressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    
    var users: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let user = users else {
            fatalError()
        }
        
        fullAddressLabel.text = "Full Address: \(user.location.country), \(user.location.street.number) \(user.location.street.name), \(user.location.city), \(user.location.state)"
        phoneNumberLabel.text = "Phone Number: \(user.phone)"
        dateOfBirthLabel.text = "DoB: \(user.dob.date)"
    }
}

