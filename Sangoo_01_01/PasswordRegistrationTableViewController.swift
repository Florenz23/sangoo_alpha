import UIKit
import RealmSwift


class PasswordRegistrationTableViewController: UITableViewController {
    
    //textFields
    var uiFields = UIRegistration()

    
    var userData = UserData()
    var authData = AuthData()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
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
        
        
        let textFieldDescription = "Password"
        let guardedData = authData.userName
        uiFields.setupTextField(description : textFieldDescription, text : guardedData)
        //uiFields.textField.delegate = self
        uiFields.textField.isSecureTextEntry = true

        
        uiFields.setupButton()
        uiFields.button.addTarget(self, action: #selector(nextButtonTapped), for: .touchDown)
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
        print(userData)
        print(authData)
    }
    
    func guardData () {
        
        authData.userPassword = uiFields.textField.text!
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "demoCell", for: indexPath)
        //disableSelection
        cell.selectionStyle = .none
        
        
        if indexPath.row == 0 {
            cell.addSubview(uiFields.textField)
        }
        else if indexPath.row == 1 {
            cell.addSubview(uiFields.button)
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
        
        let v = LastNameRegistrationTableViewController()
        
        navigationController?.pushViewController(v, animated: true)
        
    }
    
}