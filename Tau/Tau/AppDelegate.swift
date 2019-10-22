//
//  AppDelegate.swift
//  Tau
//
//  Created by Iskander Foatov on 20.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appCoordinator = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appCoordinator.start()
        return true
    }


}

