//
//  RealmHelper.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 07.02.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    
    var realm: Realm!
    
    
    func iniRealm(user : SyncUser)  -> Realm {
        DispatchQueue.main.async {
            // Open Realm
            let configuration = Realm.Configuration(
                syncConfiguration: SyncConfiguration(user: user, realmURL: URL(string: "realm://10.0.1.4:9080/~/sangoo")!)
            )
            self.realm = try! Realm(configuration: configuration)
            
        }
        return realm
    }
    
    
}
