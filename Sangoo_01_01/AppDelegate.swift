import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        //window?.rootViewController = UINavigationController(rootViewController: ViewController(style: .plain))
        let nav1 = UINavigationController()
        let mainView = LandingPageTableViewController(nibName: nil, bundle: nil) //ViewController = Name of your controller
        nav1.viewControllers = [mainView]
        window?.rootViewController = nav1
        window?.makeKeyAndVisible()
        return true
    }
}
