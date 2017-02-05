//
//  UserDataTableViewController.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 29.01.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import UIKit

class ContactTableViewController: UITableViewController {
    
    var uiFields = UISettings()
    var headingLabel = UISettings()
    var userEmail = UISettings()
    var userPhone = UISettings()
    
    let cookie = LocalCookie()
    
    var authData = AuthData()
    var userData = UserData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iniDummy()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let userId = UserDefaults.standard.string(forKey: "isUserLoggedIn")
        print(userId)
        if (userId?.characters.count == 0){
            print("nicht Eingeloggtt")
            //let loginView = LoginTableViewController()
            //let loginNavController = UINavigationController(rootViewController: loginView)
            goBackToLandingPage()
        }
    }
    
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "demoCell")
        tableView.backgroundColor = UIColor(red: 0.949,green: 0.949,blue: 0.949,alpha: 1)
        tableView.separatorStyle = .none
        
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(options))
        
        var headingText = userData.userFirstName + userData.userLastName
        headingText = "Hans Peter"
        headingLabel.setupHeadingLabel(text: headingText)
        userEmail.setupTextField(description: "Email", text: userData.userEmail)
        userPhone.setupTextField(description: "Phone", text: userData.userPhone)
        
        
        
    }
    // MARK: - Table view data source
    func iniDummy() {
        authData.userName = "Hans23"
        authData.userPassword = "asdfsdf234234"
        
        userData.userId = authData.userId
        userData.userFirstName = "Hans"
        userData.userLastName = "Peter"
        userData.userEmail = "hans@gxm.de"
        userData.userPhone = "23423234234"
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "demoCell", for: indexPath)
        cell.selectionStyle = .none
        
        //disableSelection
        
        if indexPath.row == 0 {
            cell.addSubview(headingLabel.headingLabel)
        }
        else if indexPath.row == 1 {
            cell.addSubview(userEmail.textField)
        }
        else if indexPath.row == 2 {
            cell.addSubview(userPhone.textField)
        }
        else if indexPath.row == 3 {
            cell.textLabel?.text = "Ausloggen"
            cell.textLabel?.textColor = UIColor.blue
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            logout()
        }
    }
    
    func logout() {
        print("Logout")
        cookie.removeCookie()
        goBackToLandingPage()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 80
        } else if indexPath.row == 1 {
            return 60
        } else {
            return 60
        }
    }
    
    func options() {
        
        print("jojo")
        
    }
    
    func goBackToLandingPage(){
        
        
        let v = LandingPageTableViewController()
        self.tabBarController?.tabBar.isHidden = false
        v.tabBarController?.tabBar.isHidden = false
        navigationController?.pushViewController(v, animated: true)
        self.tabBarController?.tabBar.isHidden = true
        
        // hide Navigation Bar
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
}
