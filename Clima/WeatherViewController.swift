//
//  ViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
import SwiftyJSON
import Alamofire


class WeatherViewController: UIViewController, CLLocationManagerDelegate{
    
    //Constants
    let WEATHER_URL = "https://google.com"
    let APP_ID = "89246fba59c129553e3aec94e5eb68cc"
    

    //TODO: Declare instance variables here
    let locationManager = CLLocationManager()
    

    
    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //TODO:Set up the location manager here.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }
    
    
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    func getWeather(url : String, parameters : [String:String]){
        
        Alamofire.request(WEATHER_URL, method: .get, parameters: parameters, encoding: JSONEncoding.default).validate{ request, data, response in
            
            print(request!)
            print(data)
            print(response!)
            
            return .success
            
            }
            .responseJSON { response in
            print("response is \(response)")
        }
        
        
    }

    
    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    //Write the updateWeatherData method here:
    

    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    
    
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[locations.count - 1]
        
        if(location.horizontalAccuracy > 0){
            locationManager.stopUpdatingLocation();
            
            let latitude = String(location.coordinate.latitude)
            
            let longitude = String(location.coordinate.longitude)
            
            print("Latitude = \(latitude) and Longitude is  \(longitude)")
            
//            let params : [String : String] = ["lat" : latitude,
//                                              "lon": longitude,
//                                              "appid": APP_ID]
            let params : [String : String] = ["q":"London",
                                              "appid":APP_ID]

            getWeather(url : WEATHER_URL, parameters : params)
            
        }
        
    }
    
    
    //Write the didFailWithError method here:
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Location Unavailable"
    }
    
    

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    

    
    //Write the PrepareForSegue Method here
    
    
    
    
    
}


