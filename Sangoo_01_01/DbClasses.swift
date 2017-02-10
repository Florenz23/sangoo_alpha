//
//  DbClasses.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 01.02.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import RealmSwift


final class AuthData: Object {
    dynamic var userId =  NSUUID().uuidString
    dynamic var userName = ""
    dynamic var userPassword = ""
    
    override static func primaryKey() -> String? {
        return "userId"
    }
}

final class User: Object {
    dynamic var userId = UUID().uuidString
    let userData = List<UserData>()
    var userDataShared = List<UserData>()
    dynamic var userGeoData : UserGeoData?
    
    override static func primaryKey() -> String? {
        return "userId"
    }
}

final class UserData: Object {
    dynamic var descriptionEnglish = ""
    dynamic var descriptionGerman = ""
    dynamic var dataValue = ""
    
}

final class UserGeoData: Object {
    dynamic var id : Int = 0
    dynamic var latitude = ""
    dynamic var longitude = ""
    dynamic var updateTime = NSDate()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

final class UserDataList: Object {
    dynamic var id : Int = 0
    let userDataItems = List<UserData>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

final class AuthDataList: Object {
    dynamic var id : Int = 0
    let authDataItems = List<AuthData>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}





