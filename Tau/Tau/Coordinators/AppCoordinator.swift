//
//  AppCoordinator.swift
//  Tau
//
//  Created by Iskander Foatov on 21.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class AppCoordinator : Coordinator {
    
    private let window: UIWindow
    private let navController: UINavigationController
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        navController = UINavigationController()
    }
    
    func start() {
        let controller = ViewController()
        window.rootViewController = navController
        navController.pushViewController(controller, animated: false)
        window.makeKeyAndVisible()
    }
    
    
}
