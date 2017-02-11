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
        
        //connectData
        
        let userDataFirstName = createUserData(description: "Vorname",value: "Donald")
        trumpUser.connectData.append(userDataFirstName)
        let userDataLastName = createUserData(description: "Nachname",value: "Trump")
        trumpUser.connectData.append(userDataLastName)
        let userDataPhone = createUserData(description: "Telefonnummer",value: "111111")
        trumpUser.connectData.append(userDataPhone)
        let userDataEmail = createUserData(description: "Email",value: "Trump@maga.com")
        trumpUser.connectData.append(userDataEmail)
        
        let userDataFirstName1 = createUserData(description: "Vorname",value: "Hillary")
        hillaryUser.connectData.append(userDataFirstName1)
        let userDataLastName1 = createUserData(description: "Nachname",value: "Clinton")
        hillaryUser.connectData.append(userDataLastName1)
        let userDataPhone1 = createUserData(description: "Telefonnummer",value: "222222")
        hillaryUser.connectData.append(userDataPhone1)
        let userDataEmail1 = createUserData(description: "Email",value: "hillary@war.com")
        hillaryUser.connectData.append(userDataEmail1)

        
        // ConnectList
        let trumpConnectList = ConnectList()
        let hillaryConnectList = ConnectList()

        
        // ConnectUserList
        let trumpConnectUserList = ConnectUserList()
        let hillaryConnectUserList = ConnectUserList()
        
        // userRelationDataShared
        
        trumpConnectUserList.userDataShared.append(userDataFirstName1)
        trumpConnectUserList.userDataShared.append(userDataLastName1)
        
        hillaryConnectUserList.userDataShared.append(userDataPhone)
        hillaryConnectUserList.userDataShared.append(userDataEmail)
        
        // userRelationDataShared
        
        trumpConnectUserList.userDescription.append(userDataFirstName1)
        
        hillaryConnectUserList.userDescription.append(userDataFirstName)
        
        // add Relation
        
        trumpConnectList.connectUserList.append(trumpConnectUserList)
        hillaryConnectList.connectUserList.append(hillaryConnectUserList)
        
        // add Relation
        
        trumpUser.connectList.append(trumpConnectList)
        hillaryUser.connectList.append(hillaryConnectList)
        
    }
    
    func createUserData(description : String, value : String) -> ConnectData {
        
        let userData = ConnectData()
        print(userData)
        userData.descriptionGerman = description
        userData.dataValue = value
        return userData
        
    }
    
}
