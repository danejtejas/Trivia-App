//
//  AppDelegate.swift
//  Trivia App
//
//  Created by Tejas on 05/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import UIKit
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setNavigationTitle()
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Trivia")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    
    func setNavigationTitle() {
        
        
        
        
        
        
        let navBgColor : UIColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        let navTitleColor : UIColor = .white
        
        
        let titleFontAttrs = [ NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 17)!, NSAttributedString.Key.foregroundColor: navTitleColor ]
        let barButtonFontAttrs = [ NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 14)! ]
        
        UINavigationBar.appearance().tintColor = UIColor.white // bar icons
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = navBgColor // If you want different nav background color other than white
            
            appearance.shadowImage = UIImage()
            appearance.titleTextAttributes = titleFontAttrs
            appearance.largeTitleTextAttributes = titleFontAttrs // If your app supports largeNavBarTitle
            
            UINavigationBar.appearance().isTranslucent = false
            
            appearance.buttonAppearance.normal.titleTextAttributes = barButtonFontAttrs
            appearance.buttonAppearance.highlighted.titleTextAttributes = barButtonFontAttrs
            
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            UINavigationBar.appearance().barTintColor = navBgColor // bar background
            UINavigationBar.appearance().shadowImage = UIImage()
            
            UINavigationBar.appearance().titleTextAttributes = titleFontAttrs
            
            UINavigationBar.appearance().isTranslucent = false
            
            UIBarButtonItem.appearance().setTitleTextAttributes(barButtonFontAttrs, for: .normal)
            UIBarButtonItem.appearance().setTitleTextAttributes(barButtonFontAttrs, for: .highlighted)
            
            
        }
        
    }
    
    
}

