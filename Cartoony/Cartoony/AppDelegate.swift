//
//  AppDelegate.swift
//  Cartoony
//
//  Created by Abduraxmon on 05/12/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let vc = MainVc(nibName: "MainVc", bundle: nil)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }

}

