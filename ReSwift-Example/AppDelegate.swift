//
//  AppDelegate.swift
//  ReSwift-Example
//
//  Created by Malcolm Jarvis on 2018-05-02.
//  Copyright © 2018 ReSwift. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = ViewController()

        self.window = window

        window.makeKeyAndVisible()

        return true
    }
}

