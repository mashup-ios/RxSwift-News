//
//  AppDelegate.swift
//  News
//
//  Created by 이병찬 on 2019/10/05.
//  Copyright © 2019 이병찬. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var rootWindow: UIWindow!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.rootWindow = UIWindow()
        rootWindow.rootViewController = MainViewController(viewModel: MainViewModel())
        rootWindow.makeKeyAndVisible()
        
        return true
    }
}

