//
//  AppDelegate.swift
//  ReSwift-Example
//
//  Created by Malcolm Jarvis on 2018-05-02.
//  Copyright © 2018 ReSwift. All rights reserved.
//

import UIKit
import ReSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let store: Store<AppState> = Store(
        reducer: appStateReducer(),
        state: nil, // Default `AppState` -- I prefer to let the reducers create the initial state
        middleware: [
            StatePersistence.middleware()
        ]
    )

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = CounterViewController(store: store)

        self.window = window

        if let action = StatePersistence<AppState>.restore() {
            store.dispatch(action)
        }

        window.makeKeyAndVisible()

        return true
    }
}

