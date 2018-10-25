//
//  ViewController.swift
//  Dark Skies
//
//  Created by Alex Richardson on 10/24/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        // Do any additional setup after loading the view, typically from a nib.
    }


}

