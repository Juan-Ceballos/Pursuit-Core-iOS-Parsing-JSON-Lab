//
//  WeatherController.swift
//  Parsing-JSON
//
//  Created by Juan Ceballos on 11/28/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import UIKit

class WeatherController: UIViewController {

    @IBOutlet weak var weatherTableView: UITableView!
    
    var cityWeathers = [CityWeather]()  {
        didSet  {
            weatherTableView.reloadData()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        cityWeathers = CityWeatherData.getCityWeathers()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailedWeatherController = segue.destination as? DetailedWeatherController, let indexPath = weatherTableView.indexPathForSelectedRow
            else    {
                fatalError("Passed nil in segue")
        }
        
        let cityWeather = cityWeathers[indexPath.row]
        detailedWeatherController.cityWeather = cityWeather
    }
}

extension WeatherController: UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityWeathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weatherCell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        let cityWeather = cityWeathers[indexPath.row] // with instance of object can put properties in cell
        
        weatherCell.textLabel?.text = cityWeather.name
        return weatherCell
    }
}
