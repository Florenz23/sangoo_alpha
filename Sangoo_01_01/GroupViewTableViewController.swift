//
//  GroupViewTableViewController.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 14.02.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import UIKit
import RealmSwift

class GroupViewTableViewController: UITableViewController {
    
    var notificationToken: NotificationToken!
    var realm: Realm!
    var realmHelper = RealmHelper()
    var messages = List<Message>()
    var receivedRealm : Realm!
    var receivedGroup : ConnectList?


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupRealm()
        
    }
    
    func setupUI() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(showGroupMember))
    }
    
    func showGroupMember() {
        
        print("groupMember")
        
    }
    
    func setupRealm() {
        
        DispatchQueue.main.async {
            
            // Show initial tasks
            func updateList() {
                if self.messages.realm == nil, let list = self.receivedGroup {
                    self.messages = list.message
                    print(self.messages)
                }
                self.tableView.reloadData()
            }
            updateList()
            
            // Notify us when Realm changes
            self.notificationToken = self.receivedRealm.addNotificationBlock { _ in
                updateList()
            }
        }
        
    }
    deinit {
        notificationToken.stop()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return messages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let message = messages[indexPath.row]
        print(message.messageText)
        cell.textLabel?.text = message.messageText as String

        return cell
    }
    
    
    

  
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

}
