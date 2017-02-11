//
//  DummyDbConten.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 09.02.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import Foundation


class DummyDbContent {
    
    var trumpAuth = AuthData()
    var hillaryAuth = AuthData()
    var trumpUser = User()
    var hillaryUser = User()
    
    func iniAuth() {
        
        trumpAuth.userName = "Trump23"
        trumpAuth.userPassword = "asdfasdf"
        
        hillaryAuth.userName = "Hillary23"
        hillaryAuth.userPassword = "asdfasdf"
        
    }
    
    func iniUser() {
        
        
        
        //ini Ids
        
        trumpUser.userId = trumpAuth.userId
        hillaryUser.userId = hillaryAuth.userId
        
        //userData
        
        let userDataFirstName = createUserData(description: "Vorname",value: "Donald")
        trumpUser.userData.append(userDataFirstName)
        let userDataLastName = createUserData(description: "Nachname",value: "Trump")
        trumpUser.userData.append(userDataLastName)
        let userDataPhone = createUserData(description: "Telefonnummer",value: "111111")
        trumpUser.userData.append(userDataPhone)
        let userDataEmail = createUserData(description: "Email",value: "Trump@maga.com")
        trumpUser.userData.append(userDataEmail)
        
        let userDataFirstName1 = createUserData(description: "Vorname",value: "Hillary")
        hillaryUser.userData.append(userDataFirstName1)
        let userDataLastName1 = createUserData(description: "Nachname",value: "Clinton")
        hillaryUser.userData.append(userDataLastName1)
        let userDataPhone1 = createUserData(description: "Telefonnummer",value: "222222")
        hillaryUser.userData.append(userDataPhone1)
        let userDataEmail1 = createUserData(description: "Email",value: "hillary@war.com")
        hillaryUser.userData.append(userDataEmail1)

        
        // userRelation
        let trumpUserRelation = UserRelation()
        let hillaryUserRelation = UserRelation()
        
        
        
        // userRelationDataShared
        
        trumpUserRelation.userDataShared.append(userDataFirstName1)
        trumpUserRelation.userDataShared.append(userDataLastName1)
        
        hillaryUserRelation.userDataShared.append(userDataPhone)
        hillaryUserRelation.userDataShared.append(userDataEmail)
        
        // userRelationDataShared
        
        trumpUserRelation.userDescription.append(userDataFirstName1)
        
        hillaryUserRelation.userDescription.append(userDataFirstName)
        
        // add Relation
        
        trumpUser.userRelation.append(hillaryUserRelation)
        hillaryUser.userRelation.append(trumpUserRelation)

        
    }
    
    func createUserData(description : String, value : String) -> UserData {
        
        let userData = UserData()
        print(userData)
        userData.descriptionGerman = description
        userData.dataValue = value
        return userData
        
    }
    
}
