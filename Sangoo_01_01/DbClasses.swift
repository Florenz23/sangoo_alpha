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

