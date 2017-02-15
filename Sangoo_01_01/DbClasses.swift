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
    let connectData = List<ConnectData>()
    var geoData = List<GeoData>()
    
    override static func primaryKey() -> String? {
        return "userId"
    }
}

final class GeoData: Object {
    dynamic var connectList : ConnectList?
    dynamic var latitudeKey : Double = 0
    dynamic var longitudeKey : Double = 0
    dynamic var updateTime = NSDate()
}


final class ConnectList: Object {
    var connectDescription = List<ConnectData>()
    var connectUserList = List<ConnectUserList>()
    var message = List<Message>()
}

final class Message: Object {
    
    dynamic var messageText = ""
    var userData = List<ConnectData>()
    
}


final class ConnectUserList: Object {
    let userDescription = List<ConnectData>()
    var userDataShared = List<ConnectData>()
}


final class ConnectData: Object {
    dynamic var descriptionEnglish = ""
    dynamic var descriptionGerman = ""
    dynamic var dataValue = ""
    
}


final class UserList: Object {
    dynamic var id : Int = 0
    let userDataItems = List<User>()
    
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

final class ConnectListList: Object {
    dynamic var id : Int = 0
    let connectListItems = List<ConnectList>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}





