//
//  File.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 05.02.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import UIKit


class LocalCookie {
    
    
    func setLocalCookie(userId : String) -> Void {
        
        UserDefaults.standard.set(userId,forKey:"isUserLoggedIn")
        UserDefaults.standard.synchronize()
        
    }
    
    func removeCookie() -> Void {
       
        UserDefaults.standard.set("",forKey:"isUserLoggedIn")
        UserDefaults.standard.synchronize()
        
    }
    
    
}
