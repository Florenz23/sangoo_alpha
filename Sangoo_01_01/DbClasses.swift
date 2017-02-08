//
//  DbClasses.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 01.02.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import RealmSwift


final class AuthDataList: Object {
    dynamic var id : Int = 0
    let authDataItems = List<AuthData>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

final class AuthData: Object {
    dynamic var userId =  NSUUID().uuidString
    dynamic var userName = ""
    dynamic var userPassword = ""
    
    override static func primaryKey() -> String? {
        return "userId"
    }
}

final class UserDataList: Object {
    dynamic var userId = UUID().uuidString
    let userDataItems = List<UserData>()
    
    override static func primaryKey() -> String? {
        return "userId"
    }
}


final class User: Object {
    dynamic var userId = UUID().uuidString
    dynamic var userData : UserData?
    let userRelations = List<UserRelations>()
    dynamic var userGeoData : UserGeoData?
    
    override static func primaryKey() -> String? {
        return "userId"
    }
}

final class UserData: Object {
    dynamic var userId = UUID().uuidString
    dynamic var userFirstName = ""
    dynamic var userLastName = ""
    dynamic var userEmail = ""
    dynamic var userPhone = ""
    
    override static func primaryKey() -> String? {
        return "userId"
    }
}

final class UserRelations: Object {
    dynamic var id : Int = 0
    let userRelationsContact = List<UserRelationsContact>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

final class UserRelationsContact: Object {
    dynamic var id : Int = 0
    dynamic var contactId = ""
    let userRelationsContactSharedData = List<UserRelationsContactSharedData>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

final class UserRelationsContactSharedData: Object {
    dynamic var id : Int = 0
    dynamic var sharedDataKeys = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

final class SharedDataKeys: Object {
    dynamic var keyId : Int = 0
    dynamic var keyDescription = ""
    
    override static func primaryKey() -> String? {
        return "keyId"
    }
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


