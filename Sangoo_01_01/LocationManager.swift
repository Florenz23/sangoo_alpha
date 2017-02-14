//
//  LocationManager.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 14.02.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import SwiftLocation
import MapKit


class LocationManager {
    
    
    var coordinates : CLLocationCoordinate2D?
    
    
    func askPermission() {
        //ask for WhenInUse authorization
    }
    
    func getCurrentLocation() {
        
        Location.getLocation(withAccuracy: .house, frequency: .oneShot, timeout: 50, onSuccess: { (location) in
            self.coordinates = location.coordinate
            // You will receive at max one event if desidered accuracy can be achieved; this because you have set .OneShot as frequency.
        }) { (lastValidLocation, error) in
        }
        
        // RxLocationManager.Standard is a shared standard location service instance
    }
    
    
    
}
