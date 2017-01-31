//
//  FinalRegisterTableViewController.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 31.01.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import UIKit
import RealmSwift
import SkyFloatingLabelTextField


final class AuthDataList: Object {
    dynamic var id : Int = 0
    let authDataItems = List<AuthData>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

final class AuthData: Object {
    dynamic var userId =  NSUUID().uuidString
    dynamic var userName = ""
    dynamic var userPassword = ""
    
    override static func primaryKey() -> String? {
        return "userId"
    }
}


class FinalRegisterTableViewController: UITableViewController {

    var authData = List<AuthData>()
    var notificationToken: NotificationToken!
    var realm: Realm!
    
    
    //textFields
    let userName = SkyFloatingLabelTextField(frame: CGRect(x:10,y:10,width:200,height:45))
    let userPassword = SkyFloatingLabelTextField(frame: CGRect(x:10,y:10,width:200,height:45))
    let repeatPassword = SkyFloatingLabelTextField(frame: CGRect(x:10,y:10,width:200,height:45))
    
    // Buttons
    
    var loginButton = UIButton(frame: CGRect(x:10,y:10,width:(UIScreen.main.bounds.width - 40)/3,height:40))
    var registerButton = UIButton(frame: CGRect(x:30 + 2 * (UIScreen.main.bounds.width - 40)/3,y:10,width:(UIScreen.main.bounds.width - 40)/3,height:40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupRealm()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        if (isUserLoggedIn){
            print("Logged in")
            goSegue()
        }
    }
    
    func setupUI() {
        // Do any additional setup after loading the view, typically from a nib.
        title = "Registration"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "demoCell")
        tableView.backgroundColor = UIColor(red: 0.949,green: 0.949,blue: 0.949,alpha: 1)
        // delete border
        tableView.separatorStyle = .none
        
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.backgroundColor = UIColor(red:0.2, green: 0.6, blue:1, alpha:1)
        //pinButton.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), for: .touchDown)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchDown)
        
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(UIColor.white, for: .normal)
        registerButton.backgroundColor = UIColor(red:0.2, green: 0.6, blue:1, alpha:1)
        registerButton.titleLabel?.adjustsFontSizeToFitWidth = true
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchDown)
        
        
        userName.placeholder = "Username"
        userName.title = "Username"
        
        userPassword.placeholder = "Password"
        userPassword.title = "Password"
        
        repeatPassword.placeholder = "repeat Password"
        repeatPassword.title = "repeat Password"
        
        repeatPassword.placeholder = "repeat Password"
        repeatPassword.title = "repeat Password"
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func loginButtonTapped(_ button: UIButton) {
        print("Login pressed 👍")
        goToLoginView()
    }
    
    func registerButtonTapped(_ button: UIButton) {
        print("Register pressed 👍")
        let userPassword = self.userPassword.text!
        let repeatPassword = self.repeatPassword.text!
        let userName = self.userName.text!
        if (userPassword != repeatPassword){
            Messenger().warning(messageText : "Die Passwörter stimmen nicht überein!")
            return
        }
        if (userPassword == "" || userName == "" || repeatPassword == "") {
            Messenger().warning(messageText : "Da sein ein paar Felder leer geblieben!")
            return
        }
        if (checkUniqueUserName()){
            saveData()
        } else {
            Messenger().warning(messageText : "Deinen Benutzernamen gibt es schon!")
        }
    }
    
    func saveData() {
        print("save try")
        let authData = self.authData
        let auth = AuthData()
        auth.userName = userName.text!
        auth.userPassword = userPassword.text!
        try! authData.realm?.write {
            //authData.insert(AuthData(value: ["userId": NSUUID().uuidString, "userName": userName.text, "userPassword": userPassword.text]), at: 0)
            authData.insert(AuthData(value: auth), at: 0)
        }
    }
    
    func checkUniqueUserName() -> Bool {
        let filterString = "userName == '\(userName.text! as String)'"
        let user = realm.objects(AuthData.self).filter(filterString)
        //let user = realm.objects(AuthData.self).filter("userName == 'jo'")
        
        if (user.count == 0) {
            print("ok")
            return true
        }// => 0 because no dogs have been added to the Realm yet
        
        return false
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "demoCell", for: indexPath)
        //disableSelection
        cell.selectionStyle = .none
        
        
        if indexPath.row == 0 {
            cell.addSubview(userName)
        }
        else if indexPath.row == 1 {
            cell.addSubview(userPassword)
        } else if indexPath.row == 2 {
            cell.addSubview(repeatPassword)
        } else if indexPath.row == 3 {
            cell.addSubview(loginButton)
            cell.addSubview(registerButton)
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 80
        } else if indexPath.row == 1 {
            return 80
        } else {
            return 80
        }
    }
    
    
    
    
    func setLocalCookie() -> Void {
        
        UserDefaults.standard.set(true,forKey:"isUserLoggedIn")
        UserDefaults.standard.synchronize()
        
    }
    
    func changeToProtectedView() {
        //self.dismiss(animated: true, completion:nil)
        self.performSegue(withIdentifier: "goToSecurePage", sender: self)
        
    }
    
    
    func setupRealm() {
        // Log in existing user with username and password
        let username = "florenz.erstling@gmx.de"  // <--- Update this
        let password = "23Safreiiy#"  // <--- Update this
        
        SyncUser.logIn(with: .usernamePassword(username: username, password: password, register: false), server: URL(string: "http://10.0.1.4:9080")!) { user, error in
            guard let user = user else {
                fatalError(String(describing: error))
            }
            
            DispatchQueue.main.async {
                // Open Realm
                let configuration = Realm.Configuration(
                    syncConfiguration: SyncConfiguration(user: user, realmURL: URL(string: "realm://10.0.1.4:9080/~/sangoo")!)
                )
                self.realm = try! Realm(configuration: configuration)
                
                // Show initial tasks
                func updateList() {
                    if self.authData.realm == nil, let list = self.realm.objects(AuthDataList.self).first {
                        self.authData = list.authDataItems
                    }
                    self.tableView.reloadData()
                }
                updateList()
                
                // Notify us when Realm changes
                self.notificationToken = self.realm.addNotificationBlock { _ in
                    updateList()
                }
                
            }
        }
    }
    
    func goToLoginView() {
        
        let v = LoginTableViewController()
        
        navigationController?.pushViewController(v, animated: true)
        
    }
    
    
    
    func goSegue() {
        
        let v = CustomTabBarController()
        
        navigationController?.pushViewController(v, animated: true)
    }

}
