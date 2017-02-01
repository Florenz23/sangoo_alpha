import UIKit
import RealmSwift

class UsernameRegistrationTableViewController: UITableViewController {
    
    //textFields
    var textField = UIRegistration().iniTextField()
    
    var nextButton = UIRegistration().iniButton()
    
    var userData = UserData()
    var authData = AuthData()
    var realm: Realm!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupRealm()
    }
    
    
    func setupUI() {
        // Do any additional setup after loading the view, typically from a nib.
        title = ""
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "demoCell")
        tableView.backgroundColor = UIColor(red: 0.949,green: 0.949,blue: 0.949,alpha: 1)
        // delete border
        tableView.separatorStyle = .none
        
        
        let textFieldDescription = "Nutzername"
        let guardedData = authData.userName
        textField = UIRegistration().setupTextField(textField: textField, description : textFieldDescription, text : guardedData)
        
        
        nextButton = UIRegistration().setupButton(button: nextButton)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchDown)
        
        
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

    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func nextButtonTapped(_ button: UIButton) {
        print("Weiter pressed 👍")
        guardData()
        goToNextView()
    }
    
    func guardData () {
        
        authData.userName = textField.text!
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "demoCell", for: indexPath)
        //disableSelection
        cell.selectionStyle = .none
        
        
        if indexPath.row == 0 {
            cell.addSubview(textField)
        }
        else if indexPath.row == 1 {
            cell.addSubview(nextButton)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 80
        } else if indexPath.row == 1 {
            return 80
        } else {
            return 50
        }
    }
    
    
    func goToNextView() {
        
        let v = PasswordRegistrationTableViewController()
        v.userData = userData
        v.authData = authData

        navigationController?.pushViewController(v, animated: true)
        
    }
    
}
