//
//  WeatherDisplayViewController.swift
//  Dark Skies
//
//  Created by Alex Richardson on 10/24/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class WeatherDisplayViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var iconLabel: UILabel!
    
    @IBOutlet weak var currentTempLabel: UILabel!
    
    @IBOutlet weak var lowTempLabel: UILabel!
    
    @IBOutlet weak var highTempLabel: UILabel!
    
    var displayWeatherData: WeatherData! {
        
        didSet {
            
            iconLabel.text = displayWeatherData.condition.icon
            
            currentTempLabel.text = "\(displayWeatherData.temperature)º"
            
            highTempLabel.text = "\(displayWeatherData.highTemperature)º"
            
            lowTempLabel.text = "\(displayWeatherData.lowTemperature)º"
            
        }
        
    }
    
    var displayGeocodingData: GeocodingData! {
        
        didSet {
            
            locationLabel.text = displayGeocodingData.formattedAddress
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupDefaultUI()
        
        
    }
        
        
    
    func setupDefaultUI() {
        
        locationLabel.text = ""
        
        iconLabel.text = "🌎"
        
        currentTempLabel.text = "Enter a Location!"
        
        highTempLabel.text = "-"
        
        lowTempLabel.text = "-"
        
        
        
    }

    
    @IBAction func unwindToWeatherDisplay(segue: UIStoryboardSegue) { }
    
    
}

