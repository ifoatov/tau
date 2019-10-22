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
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        
    }

    func locationManagerShouldDisplayHeadingCalibration(_ manager: CLLocationManager) -> Bool {
        return true
    }

    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        
    }

    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        
    }

    func locationManager(_ manager: CLLocationManager, rangingBeaconsDidFailFor region: CLBeaconRegion, withError error: Error) {
        
    }

    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        
    }

    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }

    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }

    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        
    }

    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
        
    }

    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
        
    }

    func locationManager(_ manager: CLLocationManager, didFinishDeferredUpdatesWithError error: Error?) {
        
    }

    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
        
    }
}

