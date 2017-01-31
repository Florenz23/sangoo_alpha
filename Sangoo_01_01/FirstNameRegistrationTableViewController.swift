import UIKit
import RealmSwift
import SkyFloatingLabelTextField



class FirstNameRegistrationTableViewController: UITableViewController {
    
    //textFields
    var textField = UIRegistration().iniTextField()

    var loginButton = UIRegistration().iniButton()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
        
        textField = UIRegistration().setupTextField(textField: textField, description : "First Name")

        
        loginButton = UIRegistration().setupButton(button: loginButton)
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func loginButtonTapped(_ button: UIButton) {
        print("Weiter pressed 👍")
        goToNextView()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "demoCell", for: indexPath)
        //disableSelection
        cell.selectionStyle = .none
        
        
        if indexPath.row == 0 {
            cell.addSubview(textField)
        }
        else if indexPath.row == 1 {
            cell.addSubview(loginButton)
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
        
        let v = LoginTableViewController()
        
        navigationController?.pushViewController(v, animated: true)
        
    }
    
}
