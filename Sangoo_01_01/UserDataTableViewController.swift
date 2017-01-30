//
//  UserDataTableViewController.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 29.01.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import UIKit

class UserDataTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        title = "Settings"
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}
