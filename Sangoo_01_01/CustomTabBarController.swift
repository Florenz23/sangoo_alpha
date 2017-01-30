//
//  CustomTabBarController.swift
//  RealmTasksTutoiral
//
//  Created by Florenz Erstling on 27.01.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup our custom view controllers
        
        let connectController = ConnectTableViewController()
        let navController = ContactTableViewController()
        let settingController = UserDataTableViewController()
        let connectNavController = createTabElement(controller: connectController, navTitle : "Connect", imageName: "connect")
        let contactNavController = createTabElement(controller: navController, navTitle : "Contacts", imageName: "contacts")
        let settingNavController = createTabElement(controller: settingController, navTitle : "Settings", imageName: "settings")
        
        
        viewControllers = [connectNavController, contactNavController, settingNavController]
        
        
        //setup login
       

    }
    
    override func viewDidAppear(_ animated: Bool) {
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        if (!isUserLoggedIn){
            print("nicht Eingeloggt")
            let loginView = LoginTableViewController()
            let loginNavController = UINavigationController(rootViewController: loginView)
            goSegue()
        }
    }
    
    func createTabElement(controller: UITableViewController, navTitle : String, imageName: String) -> UINavigationController {
    
        let connectNavController = UINavigationController(rootViewController: controller)
        connectNavController.tabBarItem.title = "Connect"
        connectNavController.tabBarItem.image = UIImage(named:"connect")
        
        return connectNavController
    
    }
    
    func goSegue() {
        
        let v = LoginTableViewController()
        
        navigationController?.pushViewController(v, animated: true)
    }

    
}
