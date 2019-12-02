//
//  DetailedColorController.swift
//  Parsing-JSON
//
//  Created by Juan Ceballos on 12/1/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import UIKit

class DetailedColorController: UIViewController {
    
    @IBOutlet weak var hexLabel: UILabel!
    @IBOutlet weak var rgbLabel: UILabel!
    
    var colors: Color?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let color = colors else   {
            fatalError("updataUI")
        }
        
        hexLabel.text = "Hex: \(color.hex.value)"
        rgbLabel.text = "RGB Value: \(color.rgb.value)"
    }
}


