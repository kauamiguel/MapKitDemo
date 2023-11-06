//
//  LocationManager.swift
//  GeoLocation
//
//  Created by Kaua Miguel on 06/11/23.
//

import Foundation
import CoreLocation

class LocationManager : CLLocationManagerDelegate{
    
    static let shared = LocationManager()
    
    let manager = CLLocationManager()
    
    func requestAuthorization(){
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
    }
}
