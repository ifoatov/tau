//
//  MapModuleView.swift
//  Tau
//
//  Created by Iskander Foatov on 21.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

import UIKit

let doubleOffset: CGFloat = 16
let defaultOffset: CGFloat = 8

final class MapModuleView: UIView {

//    let loadingSpinner = UIActivityIndicatorView(style: .gray)
    let ratingStackView = UIStackView(frame: .zero)
    let ratingLabel = UILabel(frame: .zero)
    let machineTypeStackView = UIStackView(frame: .zero)
    let titleLabel = UILabel(frame: .zero)
    let addressLabel = UILabel(frame: .zero)
    let chargeTypeStackView = UIStackView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
        setupConstraints()
    }
    
    private func configureUI() {
        backgroundColor = .white
        layer.cornerRadius = defaultOffset
        layer.shadowColor = UIColor(red: 0.04, green: 0.18, blue: 0.39, alpha: 0.2).cgColor
        layer.shadowRadius = 12
        layer.shadowOffset = CGSize(width: 0, height: 6)
        layer.shadowOpacity = 1
//        loadingSpinner.startAnimating()
        
        ratingStackView.axis = .horizontal
        machineTypeStackView.axis = .horizontal
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        addressLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        addressLabel.textColor = .gray
        chargeTypeStackView.axis = .horizontal
        chargeTypeStackView.spacing = defaultOffset
        chargeTypeStackView.alignment = .center
        chargeTypeStackView.distribution = .equalCentering
        
        addSubview(ratingStackView)
        ratingStackView.alignment = .center
        ratingStackView.distribution = .equalCentering
        ratingStackView.spacing = 6.0
        ratingStackView.addArrangedSubview(UIImageView(image: UIImage(named: "Star")))
        ratingStackView.addArrangedSubview(ratingLabel)
        
//        addSubview(loadingSpinner)
        addSubview(machineTypeStackView)
        addSubview(titleLabel)
        addSubview(addressLabel)
        addSubview(chargeTypeStackView)
    }
    
    private func setupConstraints() {
//        loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        ratingStackView.translatesAutoresizingMaskIntoConstraints = false
        machineTypeStackView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        chargeTypeStackView.translatesAutoresizingMaskIntoConstraints = false
        
//        loadingSpinner.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        loadingSpinner.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        ratingStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: doubleOffset).isActive = true
        ratingStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: doubleOffset).isActive = true
        
        machineTypeStackView.centerYAnchor.constraint(equalTo: ratingStackView.centerYAnchor).isActive = true
        machineTypeStackView.leftAnchor.constraint(equalTo: ratingStackView.rightAnchor, constant: doubleOffset).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: ratingStackView.bottomAnchor, constant: doubleOffset).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: doubleOffset).isActive = true
        
        addressLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: defaultOffset).isActive = true
        addressLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: doubleOffset).isActive = true
        
        chargeTypeStackView.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: defaultOffset).isActive = true
        chargeTypeStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: doubleOffset).isActive = true
        chargeTypeStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -doubleOffset).isActive = true
    }
    

}
