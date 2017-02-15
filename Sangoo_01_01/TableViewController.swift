//
//  ContactTableViewController.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 29.01.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import UIKit
import RealmSwift


class TableViewController: UITableViewController {
    
    // MARK: Model
    
    var notificationToken: NotificationToken!
    var realm: Realm!
    var realmHelper = RealmHelper()
    var connectLists = List<ConnectList>()
    var user = User()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupRealm(syncUser: SyncUser.current!)
    }
    
    func setupUI() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createGroup))
    }
    
    
    
    func setupRealm(syncUser : SyncUser) {
        
        DispatchQueue.main.async {
            
            self.realm = self.realmHelper.iniRealm(syncUser: syncUser)
            //self.connectLists = self.realmHelper.getUser(user: self.user).geoData
            self.tableView.reloadData()
            
        }
        
    }
    
    func createGroup() {
        
        print("create")

    }
    
    
    
    // MARK: tableView
    
    
    override func tableView(_ tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return connectLists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = connectLists[indexPath.row]
        //cell.textLabel?.text = item.connectDescription[0].dataValue
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    // MARK: Functions
}
