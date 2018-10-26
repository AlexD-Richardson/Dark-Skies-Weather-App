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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weatherData = WeatherData(tempature: 50.0, highTempature: 70.0, lowTempature: 32.0, condition: .fog)
        
        setupDefaultUI()
        
        
        let apikeys = APIKeys()
        
        let darkSkyURL = "https://api.darksky.net/forecast/"
        
        let darkSkyKey = apikeys.darkSkyKey
        
        let latitude = "37.8267"
        
        let longitude = "-122.4233"
        
        let url = darkSkyURL + darkSkyKey + "/" + latitude + "," + longitude
        
        let request = Alamofire.request(url)
        
        request.responseJSON { response in
            switch response.result {
                
            case .success(let value):
                
                let json = JSON(value)
                
                print(json)
                
            case .failure(let error): print(error.localizedDescription)
                
            }
        }
        
        let googleBaseURL = "https://maps.googleapis.com/maps/api/geocode/json?address="
        
        let googleRequestURL = googleBaseURL + "Glasgow,+Kentucky" + "&key=" + apikeys.googleKey
        
        let googleRequest = Alamofire.request(googleRequestURL)
        
        googleRequest.responseJSON { response in
            
            switch response.result {
                
            case .success(let value):
                
                let json = JSON(value)
                
                print(json)
                
            case .failure(let error):
                
                print(error.localizedDescription)
                
            }
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupDefaultUI() {
        
        locationLabel.text = ""
        
        iconLabel.text = "❄️"
        
        currentTempLabel.text = "Enter a Location!"
        
        highTempLabel.text = "-"
        
        lowTempLabel.text = "-"
        
        
        
    }


}

