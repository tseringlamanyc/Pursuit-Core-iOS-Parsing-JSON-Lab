

import UIKit

class DetailWeatherViewController: UIViewController {
    
    
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var weatherText: UILabel!
    
    var oneWeather: Weather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDetails()
    }
    
    func loadDetails() {
        currentTemp.text = "Current temperature is \(oneWeather.main["temp"] ?? 0.0)˚C"
        let weatherDescription = oneWeather.weather.first?.description
        weatherText.text = weatherDescription
        
    }
    


}
