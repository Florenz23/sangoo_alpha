//
//  DbConnector.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 07.02.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

// Private Helpers

private var realm: Realm! // FIXME: shouldn't have to hold on to the Realm here. https://github.com/realm/realm-sync/issues/694
private var deduplicationNotificationToken: NotificationToken! // FIXME: Remove once core supports ordered sets: https://github.com/realm/realm-core/issues/1206

private func setDefaultRealmConfiguration(with user: SyncUser) {
    Realm.Configuration.defaultConfiguration = Realm.Configuration(
        syncConfiguration: SyncConfiguration(user: user, realmURL: Constants.syncServerURL!),
        objectTypes: [UserData.self, AuthData.self, User.self, UserGeoData.self, UserDataList.self, AuthDataList.self]
    )
    let realm = try! Realm()
    
    if realm.isEmpty {
        try! realm.write {
            let dummyContent = DummyDbContent()
            dummyContent.iniAuth()
            dummyContent.iniUser()
            realm.add(dummyContent.trumpAuth)
            realm.add(dummyContent.hillaryAuth)
            realm.add(dummyContent.trumpUser)
            realm.add(dummyContent.hillaryUser)
        }
    }
    
    // FIXME: Remove once core supports ordered sets: https://github.com/realm/realm-core/issues/1206
    deduplicationNotificationToken = realm.addNotificationBlock { _, realm in
//        let items = realm.objects(UserDataList.self).first!.userDataItems
//        guard items.count > 1 && !realm.isInWriteTransaction else { return }
//        let itemsReference = ThreadSafeReference(to: items)
//        // Deduplicate
//        DispatchQueue(label: "io.realm.RealmTasks.bg").async {
//            let realm = try! Realm(configuration: realm.configuration)
//            guard let items = realm.resolve(itemsReference), items.count > 1 else {
//                return
//            }
//            realm.beginWrite()
//            let listReferenceIDs = NSCountedSet(array: items.map { $0.id })
//            for id in listReferenceIDs where listReferenceIDs.count(for: id) > 1 {
//                let id = id as! Int
//                let indexesToRemove = items.enumerated().flatMap { index, element in
//                    return element.id == id ? index : nil
//                }
//                indexesToRemove.dropFirst().reversed().forEach(items.remove(objectAtIndex:))
//            }
//            try! realm.commitWrite()
//        }
    }
}

// Internal Functions

// returns true on success
func configureDefaultRealm() -> Bool {
    if let user = SyncUser.current {
        setDefaultRealmConfiguration(with: user)
        return true
    }
    return false
}

func authenticate(username: String, password: String, register: Bool, callback: @escaping (NSError?) -> Void) {
    let credentials = SyncCredentials.usernamePassword(username: username, password: password, register: register)
    SyncUser.logIn(with: credentials, server: Constants.syncAuthURL) { user, error in
        DispatchQueue.main.async {
            if let user = user {
                setDefaultRealmConfiguration(with: user)
            }
            
            let error = error as NSError?
            
            if let error = error, error._code == SyncError.httpStatusCodeError.rawValue && (error.userInfo["statusCode"] as? Int) == 400 {
                // FIXME: workararound for https://github.com/realm/realm-cocoa-private/issues/204
                let improvedError = NSError(error: error,
                                            description: "Incorrect username or password.",
                                            recoverySuggestion: "Please check username and password or register a new account.")
                callback(improvedError)
            } else {
                callback(error)
            }
        }
    }
}

//func setupRealm1() {
//    // Log in existing user with username and password
//    let username = "test@gmx.de"  // <--- Update this
//    let password = "asdfasdf"  // <--- Update this
//    
//    SyncUser.logIn(with: .usernamePassword(username: username, password: password, register: false), server: URL(string: "http://10.0.1.4:9080")!) { user, error in
//        guard let user = user else {
//            fatalError(String(describing: error))
//        }
//        
//        DispatchQueue.main.async {
//            // Open Realma
//            let configuration = Realm.Configuration(
//                syncConfiguration: SyncConfiguration(user: user, realmURL: URL(string: "realm://10.0.1.4:9080/~/sangoo")!)
//            )
//            self.realm = try! Realm(configuration: configuration)
//            
//        }
//    }
//}


private extension NSError {
    
    convenience init(error: NSError, description: String?, recoverySuggestion: String?) {
        var userInfo = error.userInfo
        
        userInfo[NSLocalizedDescriptionKey] = description
        userInfo[NSLocalizedRecoverySuggestionErrorKey] = recoverySuggestion
        
        self.init(domain: error.domain, code: error.code, userInfo: userInfo)
    }
    
}

