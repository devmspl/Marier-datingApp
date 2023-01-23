//
//  LocationClass.swift
//  Marier
//
//  Created by MacBook M1 on 20/01/23.
//

import UIKit
import CoreLocation

class LocationClass: NSObject,CLLocationManagerDelegate {

    var manager = CLLocationManager()
    
    func currentLocation()->Location{
        return Location(type: "Point", coordinates: [75.75,74.5])
    }
    
    
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        if let location = locations.first {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
        }
    }
}
