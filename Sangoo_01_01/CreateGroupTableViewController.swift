import UIKit
import RealmSwift
import MapKit


class CreateGroupTableViewController: UITableViewController {
    
    //textFields
    var uiFields = UIRegistration()
    
    var userData = RegistrationUserData()
    
    var realmHelper = RealmHelper()
    var realm : Realm!
    var user = User()
    var locationManager = LocationManager()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupRealm(syncUser : SyncUser.current!)
        getLocationCoordinates()
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
        
        let textFieldDescription = "Gruppenname"
        uiFields.setupTextField(description: textFieldDescription, text: "")
        
        uiFields.setupButton()
        uiFields.button.addTarget(self, action: #selector(createGroupButtonTapped), for: .touchDown)
        
        
    }
    
    func setupRealm(syncUser : SyncUser) {
        
        DispatchQueue.main.async {
            
            self.realm = self.realmHelper.iniRealm(syncUser: syncUser)
            self.user = self.realmHelper.getUser(user: self.user)
            
        }
        
    }
    
    
    
    func createGroupButtonTapped(_ button: UIButton) {
        createGroup()
        goBackToGroupsOverview()
    }
    
    func createGroup () {
        
        print("Erstelle Gruppe")
        let group = ConnectList()
        let groupDescription = ConnectData()
        let groupAdmin = user.userData[0]
        let groupAdminData = ConnectUserList()
        groupAdminData.userDescription.append(groupAdmin)
        groupDescription.descriptionGerman = "Gruppenname"
        groupDescription.dataValue = uiFields.textField.text!
        group.connectDescription.append(groupDescription)
        group.connectUserList.append(groupAdminData)
        DispatchQueue.main.async {
            let geoData = GeoData()
            let coordinates = self.locationManager.coordinates
            // todo Check if coordinates exist, sonst warten
            geoData.lng = (coordinates?.longitude)!
            geoData.lat = (coordinates?.latitude)!
            let connectListList = self.realmHelper.getConnectListList()
            try! self.realm.write {
                self.user.geoData.append(geoData)
                connectListList?.connectListItems.append(group)
            }
        }
    }
    
    func getLocationCoordinates() {
        self.locationManager.getCurrentLocation { (result) in
            switch result
            {
            case .Success(let users):
                print(users as Any)
                print("got it")
                /* work with users*/
                break
            case .Failure(let error):
                /* present an error */
                print(error as Any)
                break
            }
        }
    }
    
    
    // MARK: - Table view data source

    
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    
    
    func goBackToGroupsOverview() {
        
        let v = ConnectTableViewController()
        navigationController?.pushViewController(v, animated: true)
        
    }
    
}
