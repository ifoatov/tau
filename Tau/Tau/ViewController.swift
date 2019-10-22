//
//  ViewController.swift
//  Tau
//
//  Created by Iskander Foatov on 20.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")
        ServiceLocator.shared.networkService.getLocations { result in
            switch result {
            case .success(let locations):
                locations.forEach{ print($0.id) }
            case .failure(let error):
                print(error)
            }
        }
    }


}

