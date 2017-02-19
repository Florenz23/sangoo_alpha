//
//  ContactTableViewController.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 29.01.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import UIKit
import RealmSwift
import MapKit
import GeoQueries


class SearchGroupTableViewController: UITableViewController {
    
    // MARK: Model
    @IBOutlet weak var mapView: MKMapView!

    
    var notificationToken: NotificationToken!
    var realm: Realm!
    var realmHelper = RealmHelper()
    var geoQueryResult = [GeoData]()
    var user = User()
    let cookie = LocalCookie()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        if (!cookie.check()){
            print("nicht Eingeloggtt")
            goBackToLandingPage()
        } else {
        setupRealm(syncUser: SyncUser.current!)
        }
    }
    
    func setupUI() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    
    func setupRealm(syncUser : SyncUser) {
        
        DispatchQueue.main.async {
            
            func updateList() {
                self.realm = self.realmHelper.iniRealm(syncUser: syncUser)
                let list = try! self.realm
                    .objects(GeoData.self)
                    .filterGeoRadius(center: self.mapView.centerCoordinate, radius: 500, sortAscending: nil)
                self.geoQueryResult = list
                self.tableView.reloadData()
            }
            updateList()
            
            // Notify us when Realm changes
            self.notificationToken = self.realm.addNotificationBlock { _ in
                updateList()
            }
        }
        
    }
    deinit {
        notificationToken.stop()
    }
    
    
    // MARK: tableView
    
    
    override func tableView(_ tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return geoQueryResult.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = geoQueryResult[indexPath.row]
        //cell.textLabel?.text = item.connectDescription[0].dataValue
        cell.textLabel?.text = "moin"
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    // MARK: Functions
    
    func goBackToLandingPage(){
        
        
        let v = LandingPageTableViewController()
        self.tabBarController?.tabBar.isHidden = false
        v.tabBarController?.tabBar.isHidden = false
        // hide Navigation Bar
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(v, animated: true)
        self.tabBarController?.tabBar.isHidden = true
        
    }
}
