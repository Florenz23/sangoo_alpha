//
//  LoginTableViewController.swift
//  Sangoo_01_01
//
//  Created by Florenz Erstling on 29.01.17.
//  Copyright © 2017 Florenz. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class LandingPageTableViewController: UITableViewController {
    
    
    var placeImageView = UIImageView(frame: CGRect(x:0,y:0,width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height - 200))
    var blackImageView = UIImageView(frame: CGRect(x:0,y:0,width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height - 200))
    var placeNameLabel = UILabel(frame: CGRect(x:10,y:80,width:UIScreen.main.bounds.width - 20,height:40))
    var krakenImage = UIImageView(frame: CGRect(x:UIScreen.main.bounds.width / 2 - UIScreen.main.bounds.width / 3 / 2,y:80,width:UIScreen.main.bounds.width / 3 + 20,height:UIScreen.main.bounds.width / 3 + 30))
    var krakenBackground = UIImageView(frame: CGRect(x:0,y:0,width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height-200))

    
    
    // Buttons
    
    var loginButton = UIButton(frame: CGRect(x:0,y:0,width:UIScreen.main.bounds.width,height:70))
    var registerButton = UIButton(frame: CGRect(x:0,y:0,width:UIScreen.main.bounds.width,height:70))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        if (isUserLoggedIn){
            print("Logged in")
            goToMainView()
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
        
        //placeImageView.image = UIImage(named:"seattle")
        krakenBackground.image = UIImage(named:"green")
        //dont let is scratch
        krakenBackground.contentMode = .scaleAspectFill
        krakenBackground.clipsToBounds = true
        
        //define a filter
        blackImageView.image = UIImage(named:"black")
        blackImageView.alpha = 0.8
        blackImageView.clipsToBounds = true
        
        
        
        placeNameLabel.text = "Sangoo"
        placeNameLabel.textAlignment = .center
        placeNameLabel.textColor = UIColor.white
        placeNameLabel.font = UIFont(name: "Helvetica", size: 30)
        
        
        //Kraken
        krakenImage.image = UIImage(named:"kraken")
        //dont let is scratch
        krakenImage.contentMode = .scaleAspectFill
        krakenImage.clipsToBounds = true
        
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.backgroundColor = UIColor(red:0.83, green: 0.83 , blue:0.19, alpha:1)
        //pinButton.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), for: .touchDown)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchDown)
        
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(UIColor.white, for: .normal)
        registerButton.backgroundColor = UIColor(red:0.2, green: 0.6, blue:1, alpha:1)
        registerButton.titleLabel?.adjustsFontSizeToFitWidth = true
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchDown)
        
        
        // dont show button tabBar
        self.hidesBottomBarWhenPushed = true

        
        
    }
    // MARK: - Table view data source
    
   
    
    func loginButtonTapped(_ button: UIButton) {
        print("Login pressed 👍")
        goToLoginView()
    }
    
    func registerButtonTapped(_ button: UIButton) {
        print("Register pressed 👍")
        goToFirstLastNameRegistrationView()
    }
    
    func goToLoginView() {
        
        let v = LoginTableViewController()
        
        navigationController?.pushViewController(v, animated: true)
        
    }
    
    func goToFirstLastNameRegistrationView(){
        
        
        let v = FirstNameRegistrationTableViewController()
        
        navigationController?.pushViewController(v, animated: true)
        
    }
    
    func goToMainView() {
        
        let v = CustomTabBarController()
        
        navigationController?.pushViewController(v, animated: true)
    }

    
    
    // table view
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "demoCell", for: indexPath)
        cell.selectionStyle = .none
        
        if indexPath.row == 0 {
            cell.contentView.backgroundColor = UIColor(red:0.77, green:0.92, blue:0.83, alpha:1.0)
            cell.addSubview(krakenImage)
            //cell.addSubview(krakenBackground)
            //cell.bringSubview(toFront: krakenImage)
            //cell.addSubview(placeImageView)
            //cell.addSubview(blackImageView)
            //cell.addSubview(placeNameLabel)
            //cell.bringSubview(toFront: placeNameLabel)
            
        }
        else if indexPath.row == 1 {
            cell.addSubview(loginButton)
        } else if indexPath.row == 2 {
            cell.addSubview(registerButton)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UIScreen.main.bounds.height - 200
        } else if indexPath.row == 1 {
            return 70
        } else if indexPath.row == 2 {
            return 70
        } else {
            return 0
        }
    }
    
    
    
}
