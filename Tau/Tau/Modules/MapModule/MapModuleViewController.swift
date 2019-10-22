//
//  MapModuleViewController.swift
//  Tau
//
//  Created by Iskander Foatov on 21.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

import UIKit
import GoogleMaps

class MapModuleViewController: UIViewController {

    private weak var mapView: GMSMapView!
    
    override func loadView() {
        let goodleMapView = GMSMapView(frame: CGRect.zero)
        view = goodleMapView
        mapView = goodleMapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
