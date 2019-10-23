//
//  MapModuleViewModel.swift
//  Tau
//
//  Created by Iskander Foatov on 21.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

import Foundation
import CoreLocation
import RxSwift
import RxCocoa

final class MapModuleViewModel {
    
    // TODO: add isLoading logick
    let disposeBag = DisposeBag()
    let networkService: NetworkService
    let locationService: LocationService
    
    let selectedLocation = BehaviorRelay<LocationEntity?>(value: nil)
    
    
    private let locationsRelay = BehaviorRelay<[LocationEntity]>(value: [])
    private let userLocationRelay = BehaviorRelay<CLLocation?>(value: nil)
    private let errorRelay = BehaviorRelay<String?>(value: nil)
    private let locationInfoRelay = BehaviorRelay<LocationInfo?>(value: nil)
    
    var locations: Driver<[LocationEntity]> {
        return self.locationsRelay.asDriver()
    }
    
    var userLocation: Driver<CLLocation?> {
        return self.userLocationRelay.asDriver()
    }
    
    var message: Driver<String?> {
        return self.errorRelay.asDriver()
    }
    
    var selectedLocationInfo: Driver<LocationInfo?> {
        return locationInfoRelay.asDriver()
    }
    
    init(networkService: NetworkService, locationService: LocationService) {
        self.networkService = networkService
        self.locationService = locationService
        setup()
        setupRx()
    }
    
    private func setup() {
        locationService.didUpdateLocations.subscribe(onNext: { [weak self] locations in
            self?.userLocationRelay.accept(locations.last)
        }).disposed(by: disposeBag)
        networkService.getLocations { [weak self] result in
            switch result {
            case .success(let items):
                self?.locationsRelay.accept(items)
                self?.errorRelay.accept(nil)
            case .failure(let error):
                self?.errorRelay.accept(error.localizedDescription)
            }
        }
    }
    
    private func setupRx() {
        selectedLocation.bind { [weak self] item in
            self?.locationInfoRelay.accept(nil)
            guard let id = item?.id else {
                return
            }
            self?.loadDetailInfo(id)
        }.disposed(by: disposeBag)
    }
    
    private func loadDetailInfo(_ id: String) {
        networkService.getLocationInfo(locationId: id) { [weak self] result in
            switch result {
            case .success(let info):
                self?.locationInfoRelay.accept(info)
            case .failure(let error):
                self?.errorRelay.accept(error.localizedDescription)
            }
        }
    }
    
}

