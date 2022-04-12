//
//  AppDelegate.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import UIKit
import IQKeyboardManagerSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = SplashRouterInput().view(entryEntity: SplashEntryEntity())
        window?.makeKeyAndVisible()
        
        return true
    }
}



