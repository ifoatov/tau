//
//  LocationService.swift
//  Tau
//
//  Created by Iskander Foatov on 21.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

import Foundation
import CoreLocation
import RxSwift
import RxCocoa

final class LocationService: NSObject, CLLocationManagerDelegate {
    
    private let didUpdateRelay = BehaviorRelay<[CLLocation]>(value: [CLLocation]())
    public var didUpdateLocations: Observable<[CLLocation]> {
        return didUpdateRelay.asObservable()
    }
    
    private let locationManager: CLLocationManager
    
    init(locationManager: CLLocationManager) {
        self.locationManager = locationManager
        super.init()
        self.locationManager.delegate = self
        setup()
    }
    
    private func setup() {
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default:
            // Handle this situation
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.didUpdateRelay.accept(locations)
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        default:
            // show alert
            return
        }
    }
}

