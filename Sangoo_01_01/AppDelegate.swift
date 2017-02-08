import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        if configureDefaultRealm() {
            print("jo")
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = CustomTabBarController()
            window?.makeKeyAndVisible()
        } else {
            window?.rootViewController = LandingPageTableViewController()
            window?.makeKeyAndVisible()
            logIn(animated: false)
        }
        return true
        
        
//        let nav1 = UINavigationController()
//        let mainView = LandingPageTableViewController(nibName: nil, bundle: nil) //ViewController = Name of your controller
//        nav1.viewControllers = [mainView]
////        window?.rootViewController = nav1
//        
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.makeKeyAndVisible()
//        window?.rootViewController = CustomTabBarController()

    }
    
    func logIn(animated: Bool = true) {
        let username = "florenz.erstling@gmx.de"  // <--- Update this
        let password = "23Safreiiy#"  // <--- Update this
           // guard response.returnCode != .cancel, let username = response.username, let password = password else {
                // FIXME: handle cancellation properly or just restrict it
           //     DispatchQueue.main.async {
           //         self.logIn()
           //     }
           //     return
           // }
        authenticate(username: username, password: password, register: false) { error in
            if let error = error {
                self.present(error: error)
            } else {
                self.window?.rootViewController = CustomTabBarController()
            }
        }

        window?.rootViewController?.present(LandingPageTableViewController(), animated: false, completion: nil)
    }
    
    func present(error: NSError) {
        let alertController = UIAlertController(title: error.localizedDescription,
                                                message: error.localizedFailureReason ?? "",
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Try Again", style: .default) { _ in
            self.logIn()
        })
        window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }

}
