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
import GoogleMaps

class AppCoordinator : Coordinator {
    
    private let window: UIWindow
    private let navController: UINavigationController
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        navController = UINavigationController()
        GMSServices.provideAPIKey("AIzaSyB7hFzaG1NXE5dwsW73N027omQ8m8KsXck")
    }
    
    func start() {
        let controller = MapModuleViewController()
        let viewModel = MapModuleViewModel(networkService: ServiceLocator.shared.networkService,
                                           locationService: ServiceLocator.shared.locationService)
        controller.viewModel = viewModel
        window.rootViewController = navController
        navController.pushViewController(controller, animated: false)
        window.makeKeyAndVisible()
    }
    
    
}
