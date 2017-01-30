//
//  LoginTableViewController.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 29.01.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import UIKit
import RealmSwift
import SkyFloatingLabelTextField

class LoginTableViewController: UITableViewController {
    
    var notificationToken: NotificationToken!
    var realm: Realm!
    
    var placeImageView = UIImageView(frame: CGRect(x:0,y:0,width:UIScreen.main.bounds.width,height:200))
    var blackImageView = UIImageView(frame: CGRect(x:0,y:0,width:UIScreen.main.bounds.width,height:200))
    var placeNameLabel = UILabel(frame: CGRect(x:10,y:80,width:UIScreen.main.bounds.width - 20,height:40))
    
    //textFields
    let userName = SkyFloatingLabelTextField(frame: CGRect(x:10,y:10,width:200,height:45))
    let userPassword = SkyFloatingLabelTextField(frame: CGRect(x:10,y:10,width:200,height:45))
    
    // Buttons
    
    var loginButton = UIButton(frame: CGRect(x:10,y:10,width:(UIScreen.main.bounds.width - 40)/3,height:40))
    var registerButton = UIButton(frame: CGRect(x:30 + 2 * (UIScreen.main.bounds.width - 40)/3,y:10,width:(UIScreen.main.bounds.width - 40)/3,height:40))

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        //setupRealm()
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
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "demoCell")
        tableView.backgroundColor = UIColor(red: 0.949,green: 0.949,blue: 0.949,alpha: 1)
        // delete border
        tableView.separatorStyle = .none

        //placeImageView.image = UIImage(named:"seattle")
        placeImageView.image = UIImage(named:"logo")
        //dont let is scratch
        placeImageView.contentMode = .scaleAspectFill
        placeImageView.clipsToBounds = true
        
        //define a filter
        blackImageView.image = UIImage(named:"black")
        blackImageView.alpha = 0.8
        blackImageView.clipsToBounds = true
        
        placeNameLabel.text = "Sangoo"
        placeNameLabel.textAlignment = .center
        placeNameLabel.textColor = UIColor.white
        placeNameLabel.font = UIFont(name: "Helvetica", size: 30)
        
        
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
    }
    
    func registerButtonTapped(_ button: UIButton) {
        print("Register pressed 👍")
        goToRegistrationView()
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "demoCell", for: indexPath)
        
        if indexPath.row == 0 {
            cell.addSubview(placeImageView)
            cell.addSubview(blackImageView)
            cell.addSubview(placeNameLabel)
            cell.bringSubview(toFront: placeNameLabel)
        }
        else if indexPath.row == 1 {
            cell.addSubview(userName)
        } else if indexPath.row == 2 {
            cell.addSubview(userPassword)
        } else if indexPath.row == 3 {
            cell.addSubview(loginButton)
            cell.addSubview(registerButton)
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
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
        
        SyncUser.logIn(with: .usernamePassword(username: username, password: password, register: false), server: URL(string: "http://localhost:9080")!) { user, error in
            guard let user = user else {
                fatalError(String(describing: error))
            }
            
            DispatchQueue.main.async {
                // Open Realm
                let configuration = Realm.Configuration(
                    syncConfiguration: SyncConfiguration(user: user, realmURL: URL(string: "realm://localhost:9080/~/realmtasks")!)
                )
                self.realm = try! Realm(configuration: configuration)
                
                }
        }
    }

    
    func goSegue() {
        
        let v = CustomTabBarController()
        
        navigationController?.pushViewController(v, animated: true)
    }
    
    func goToRegistrationView() {
        
        let v = RegisterTableViewController()
        
        navigationController?.pushViewController(v, animated: true)
        
    }

   
}
