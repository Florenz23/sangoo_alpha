//
//  DummyDbConten.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 09.02.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import Foundation


class DummyDbContent {
    
    var authDataList = AuthDataList()
    var userList = UserList()
    var connectListList = ConnectListList()
    var trumpAuth = AuthData()
    var hillaryAuth = AuthData()
    var trumpUser = User()
    var hillaryUser = User()
    var trumpPublicConnectList = ConnectList()
    
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
        
        // trumpsPulbicListConnectData
        let trumpGroupDescription = createUserData(description: "Gruppenname",value: "Maga")
        trumpPublicConnectList.connectDescription.append(trumpGroupDescription)
        
        
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
        
        // add Hillary and Trump to Trumps public List
        trumpPublicConnectList.connectUserList.append(trumpConnectUserList)
        trumpPublicConnectList.connectUserList.append(hillaryConnectUserList)
        
        // add Relation
        trumpConnectList.connectUserList.append(trumpConnectUserList)
        hillaryConnectList.connectUserList.append(hillaryConnectUserList)
        
        // Add RElation description Trum Hillary
        trumpConnectList.connectDescription.append(userDataLastName)
        trumpConnectList.connectDescription.append(userDataLastName1)
        
        
        // add user to their own Groups
        trumpUser.connectList.append(trumpConnectList)
        hillaryUser.connectList.append(hillaryConnectList)
        
        // suscribe Trump and Hillary in Trumps group
        trumpUser.connectList.append(trumpPublicConnectList)
        hillaryUser.connectList.append(trumpPublicConnectList)
        
        
        // fill global List
        //ConnectListList
        connectListList.connectListItems.append(hillaryConnectList)
        connectListList.connectListItems.append(trumpConnectList)
        connectListList.connectListItems.append(trumpPublicConnectList)
        
        //AuthDataList
        authDataList.authDataItems.append(trumpAuth)
        authDataList.authDataItems.append(hillaryAuth)
        
        //UserDataList
        userList.userDataItems.append(trumpUser)
        userList.userDataItems.append(hillaryUser)
        
        // add Messages in the Group
        var message1 = Message()
        message1.messageText = "Hi Hillary"
        var message2 = Message()
        message2.messageText = "Hi Donald"
        trumpPublicConnectList.message.append(message1)
        trumpPublicConnectList.message.append(message2)
        
    }
    
    func createUserData(description : String, value : String) -> ConnectData {
        
        let userData = ConnectData()
        print(userData)
        userData.descriptionGerman = description
        userData.dataValue = value
        return userData
        
    }
    
}
