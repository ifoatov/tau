//
//  ServiceLocator.swift
//  Tau
//
//  Created by Iskander Foatov on 21.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

import Foundation
import CoreLocation

final class ServiceLocator {
    
    public static let shared = ServiceLocator()
    public let locationService: LocationService
    public let networkService: NetworkService
    
    private init() {
        locationService = LocationService(locationManager: CLLocationManager())
        networkService = NetworkService(urlSession: URLSession.shared)
    }
    
}
