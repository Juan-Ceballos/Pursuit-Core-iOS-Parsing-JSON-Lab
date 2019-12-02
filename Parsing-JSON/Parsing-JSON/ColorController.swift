//
//  ColorController.swift
//  Parsing-JSON
//
//  Created by Juan Ceballos on 12/1/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import UIKit

class ColorController: UIViewController {

    @IBOutlet weak var colorTableView: UITableView!
    
    var colors = [Color]()  {
        didSet  {
            colorTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorTableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        colors = ColorData.getColors()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailedColorController = segue.destination as? DetailedColorController, let indexPath = colorTableView.indexPathForSelectedRow else  {
            fatalError("segue")
        }
        
        let color = colors[indexPath.row]
        detailedColorController.colors = color
    }
    
}

extension ColorController: UITableViewDataSource    {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let colorCell = colorTableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        let color = colors[indexPath.row]
        
        colorCell.textLabel?.text = color.name.value
        colorCell.backgroundColor = UIColor(displayP3Red: CGFloat(color.rgb.fraction.r), green: CGFloat(color.rgb.fraction.g), blue: CGFloat(color.rgb.fraction.b), alpha: 1)
        
        return colorCell
    }
}
