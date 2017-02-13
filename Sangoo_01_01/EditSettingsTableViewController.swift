//
//  UserDataTableViewController.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 29.01.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import UIKit
import RealmSwift
import SkyFloatingLabelTextField



class EditSettingsTableViewController: UITableViewController {
    
    var userName = EditUISettings()
    var textField = EditUISettings()
    
    var realm: Realm!
    var cookie = LocalCookie()
    
    var textFieldArray = [SkyFloatingLabelTextField]()
    
    
    var authData = AuthData()
    var user = User()
    var userData = List<ConnectData>()
    var realmHelper = RealmHelper()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupRealm(syncUser: SyncUser.current!)
    }
    
    
    func setupUI() {
        
        title = "Bearbeiten"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "demoCell")
        tableView.backgroundColor = UIColor(red: 0.949,green: 0.949,blue: 0.949,alpha: 1)
        tableView.separatorStyle = .none
        
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveUserData))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        
        
        userName.setupTextField(description: "Benutzername", text: authData.userName)
        userName.disableTextField()
        
        
        
    }
    
    func createTextFields() {
        
        var textField : EditUISettings
        for data in userData {
            textField = EditUISettings()
            textField.setupTextField(description: data.descriptionGerman, text: data.dataValue)
            textFieldArray.append(textField.textField)
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "demoCell", for: indexPath)
        cell.selectionStyle = .none
        createTextFields()
        cell.addSubview(textFieldArray[indexPath.row])
        
        return cell
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
        
        print("save")
        saveData()
        goToSettings()
        //print(userData)
        //updateDataNow(userDataOld: userData)
    }
    
    
    func setupRealm(syncUser : SyncUser) {
        
        DispatchQueue.main.async {
            
            self.realm = self.realmHelper.iniRealm(syncUser: syncUser)
            self.userData = self.realmHelper.getUser(user: self.user).connectData
            self.tableView.reloadData()
            
        }
        
    }
    
    func cancel() {
        
        let v = SettingsTableViewController()
        v.navigationItem.setHidesBackButton(true, animated:true)
        navigationController?.pushViewController(v, animated: true)
        
    }
    
    func goToSettings(){
        
        let v = SettingsTableViewController()
        v.navigationItem.setHidesBackButton(true, animated:true)
        navigationController?.pushViewController(v, animated: true)
        
    }


    
    func saveData() {
        var i : Int = 0
        try! realm.write {
            for data in userData {
                data.dataValue = textFieldArray[i].text!
                i = i + 1
            }
        }
    }
    
}
