//
//  ViewController.swift
//  ParingJSONLab
//
//  Created by Tsering Lama on 11/25/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var weather = [Weather]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
    
    }
    
    func loadData() {
        weather = WeatherData.getWeather()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailWeather = segue.destination as? DetailWeatherViewController, let indexpath = tableView.indexPathForSelectedRow else {
            fatalError()
        }
        detailWeather.oneWeather = weather[indexpath.row]
    }


}

extension WeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        let data = weather[indexPath.row]
        cell.textLabel?.text = data.name
        cell.detailTextLabel?.text = ("\(data.main["temp"] ?? 0.0) C˚")
        return cell
    }
}

