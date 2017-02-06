//
//  File.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 05.02.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import UIKit


class LocalCookie {
    
    
    let defaults = UserDefaults.standard

    
    func setLocalCookie(userId : String) -> Void {
        
        defaults.set(userId, forKey: "userIdKey")
        
    }
    
    func removeCookie() -> Void {
       
        UserDefaults.standard.set("",forKey:"userIdKey")
        UserDefaults.standard.synchronize()
        
    }
    
    func getData() -> String {
        
        let userId = defaults.string(forKey: "userIdKey")
        return userId!
        
    }
    
    
}
