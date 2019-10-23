//
//  MapModuleViewController.swift
//  Tau
//
//  Created by Iskander Foatov on 21.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

import UIKit
import GoogleMaps
import RxSwift
import RxCocoa

final class MapModuleViewController: UIViewController {

    private let disposeBag = DisposeBag()
    private var mapView: GMSMapView!
    private let locationInfoView = MapModuleView(frame: .zero)
    private var userLocationMarker: GMSMarker!
    var viewModel: MapModuleViewModel!
    
    var userLocationBinder: Binder<CLLocation?> {
        return Binder(self) { owner, location in
            guard let location = location,
                owner.mapView.window != nil else {
                return
            }
            //TODO use direction
            if owner.userLocationMarker == nil {
                owner.userLocationMarker = GMSMarker(position: location.coordinate)
                owner.userLocationMarker.icon = UIImage(named: "userPosition")
                owner.userLocationMarker.map = owner.mapView
                return
            }
            owner.userLocationMarker.position = location.coordinate
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupRx()
    }
    
    private func configureUI() {
        mapView = GMSMapView(frame: view.bounds)
        mapView.delegate = self
        view.addSubview(mapView)
        locationInfoView.isHidden = true
        view.addSubview(locationInfoView)
        locationInfoView.translatesAutoresizingMaskIntoConstraints = false
        locationInfoView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -doubleOffset).isActive = true
        locationInfoView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: doubleOffset).isActive = true
        locationInfoView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -doubleOffset).isActive = true
    }
    
    private func setupRx() {
        viewModel.userLocation.asObservable().bind(to: userLocationBinder).disposed(by: disposeBag)
        viewModel.locations.drive(onNext: { [weak self] items in
            items.forEach { item in
                let position = CLLocationCoordinate2D(latitude: item.coordinates.lat, longitude: item.coordinates.lng)
                let marker = GMSMarker(position: position)
                marker.icon = UIImage(named: "location")
                marker.userData = item
                marker.map = self?.mapView
            }
        }).disposed(by: disposeBag)
        
        viewModel.selectedLocationInfo.drive(onNext: { [weak self] item in
            guard let item = item else {
                self?.locationInfoView.isHidden = true
                return
            }
            self?.locationInfoView.titleLabel.text = item.name
            self?.locationInfoView.addressLabel.text = "\(item.street), \(item.city)"
            self?.locationInfoView.ratingLabel.text = "\(item.rating)"
            self?.locationInfoView.isHidden = false
            
            self?.locationInfoView.chargeTypeStackView.subviews.forEach { $0.removeFromSuperview() }
            item.connectors.forEach { connector in
                self?.locationInfoView.chargeTypeStackView.addArrangedSubview(UIImageView(image: connector.type.image()))
            }
            
        }).disposed(by: disposeBag)
    }
}

extension MapModuleViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        guard let item = marker.userData as? LocationEntity else {
            return false
        }
        print("Tapped on mearker with id: \(item.id)")
        self.viewModel.selectedLocation.accept(item)
        return true
    }
}
