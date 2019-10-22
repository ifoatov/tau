//
//  LocationInfo.swift
//  Tau
//
//  Created by Iskander Foatov on 22.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

import Foundation

struct LocationInfo: Codable {
    let id: String
    let ownerId: String
    let name: String
    let country: String
    let city: String
    let street: String
    let postalCode: String
    let coordinates: Coordinates
    let rating: Int
    let createdAt: String
    let openingHours: OpeningHours
    let numberOfStations: Int
    let statuses: EvseStatus
    let connectors: Array<Connector>
    let services: Array<ServiceInfo>
    let photos: Array<PhotoInfo>
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case ownerId = "owner_id"
        case name = "name"
        case country = "country"
        case city = "city"
        case street = "street"
        case postalCode = "postal_code"
        case coordinates = "coordinates"
        case rating = "rating"
        case createdAt = "created_at"
        case openingHours = "opening_hours"
        case numberOfStations = "number_of_stations"
        case statuses = "statuses"
        case connectors = "connectors"
        case services = "services"
        case photos = "photos"
        case updatedAt = "updated_at"
    }
}
