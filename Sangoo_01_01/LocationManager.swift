//
//  LocationManager.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 14.02.17.
//  Copyright © 2017 Florenz. All rights reserved.
//



import SwiftLocation
import MapKit


enum AsyncResult<T>
{
    case Success(T)
    case Failure(NSError?)
}


class LocationManager {
    
    
    var coordinates : CLLocationCoordinate2D?
    
    
    func askPermission() {
        //ask for WhenInUse authorization
    }
    
    func getCurrentLocation1() {
        
        Location.getLocation(withAccuracy: .house, frequency: .oneShot, timeout: 50, onSuccess: { (location) in
            self.coordinates = location.coordinate
            // You will receive at max one event if desidered accuracy can be achieved; this because you have set .OneShot as frequency.
        }) { (lastValidLocation, error) in
        }
        
        // RxLocationManager.Standard is a shared standard location service instance
    }
    
    func getCurrentLocation(completion: @escaping (AsyncResult<CLLocationCoordinate2D?>)->())
    {
        Location.getLocation(withAccuracy: .house, frequency: .oneShot, timeout: 50, onSuccess: { (location) in
            self.coordinates = location.coordinate
            completion(AsyncResult.Success(self.coordinates))
            // You will receive at max one event if desidered accuracy can be achieved; this because you have set .OneShot as frequency.
        }) { (lastValidLocation, error) in
        }
    }

    
    
    
}
