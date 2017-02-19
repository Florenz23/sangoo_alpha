//
//  ContactTableViewController.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 29.01.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import UIKit
import RealmSwift


class SelectDataToShareTableViewController: UITableViewController {
    
    // MARK: Model
    
    var notificationToken: NotificationToken!
    var realm: Realm!
    var realmHelper = RealmHelper()
    var dataToShare = List<ConnectData>()
    var user = User()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupRealm(syncUser: SyncUser.current!)
    }
    
    func setupUI() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(createGroup))
    }
    
    
    
    func setupRealm(syncUser : SyncUser) {
        
        DispatchQueue.main.async {
            
            self.realm = self.realmHelper.iniRealm(syncUser: syncUser)
            self.dataToShare = self.realmHelper.getUser(user: self.user).userData
            self.tableView.reloadData()
            
        }
        
    }
    
    func quickTest () {
        
        let v = SelectDataToShareTableViewController()
        navigationController?.pushViewController(v, animated: false)
        
    }
    
    func searchGroup() {
        print("search")
        goToSearchGroupTableViewController()
    }
    
    func goToSearchGroupTableViewController() {
        let v = SearchGroupTableViewController()
        navigationController?.pushViewController(v, animated: true)
    }
    
    func createGroup() {
        
        print("create")
        goToCreateTableViewController()
    }
    
    func goToCreateTableViewController() {
        
        let v = CreateGroupTableViewController()
        navigationController?.pushViewController(v,animated:true)
        
    }
    
    
    // MARK: tableView
    
    
    override func tableView(_ tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return dataToShare.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = dataToShare[indexPath.row]
        cell.textLabel?.text = item.descriptionGerman
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    // MARK: Functions
}
