//
//  UserDataTableViewController.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 29.01.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import UIKit

class EditSettingsTableViewController: UITableViewController {
    
    var userName = EditUISettings()
    var userFirstName = EditUISettings()
    var userLastName = EditUISettings()
    var userEmail = EditUISettings()
    var userPhone = EditUISettings()
    
    
    var authData = AuthData()
    var userData = UserData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    func setupUI() {
        
        title = "Bearbeiten"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "demoCell")
        tableView.backgroundColor = UIColor(red: 0.949,green: 0.949,blue: 0.949,alpha: 1)
        tableView.separatorStyle = .none
        
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveUserData))
        
        
        userName.setupTextField(description: "Benutzername", text: authData.userName)
        
        
        
        userFirstName.setupTextField(description: "Vorname", text: userData.userFirstName)
        
        
        userLastName.setupTextField(description: "Nachname", text: userData.userLastName)
        
        
        userEmail.setupTextField(description: "Email", text: userData.userEmail)
        
        
        userPhone.setupTextField(description: "Telefon", text: userData.userPhone)
        
        
        
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "demoCell", for: indexPath)
        cell.selectionStyle = .none
        
        //disableSelection
        
        if indexPath.row == 0 {
            cell.addSubview(userName.textField)
        }
        else if indexPath.row == 1 {
            cell.addSubview(userFirstName.textField)
        }
        else if indexPath.row == 2 {
            cell.addSubview(userLastName.textField)
        }
        else if indexPath.row == 3 {
            cell.addSubview(userEmail.textField)
        }
        else if indexPath.row == 4 {
            cell.addSubview(userPhone.textField)
        }
            
        else if indexPath.row == 5 {
           
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 5 {
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 60
        } else if indexPath.row == 1 {
            return 60
        } else {
            return 60
        }
    }
    
    func saveUserData() {
        
        print("Save")
        let v = SettingsTableViewController()
        navigationController?.pushViewController(v, animated: true)
        v.authData = authData
        v.userData = userData
        
    }
    
}
