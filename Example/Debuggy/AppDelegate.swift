//
//  AppDelegate.swift
//  Debuggy
//
//  Created by git on 08/29/2019.
//  Copyright (c) 2019 git. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = MainViewController()
        vc.view.backgroundColor = .white
        let nav = UINavigationController(rootViewController: vc)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()

        return true
    }
}
