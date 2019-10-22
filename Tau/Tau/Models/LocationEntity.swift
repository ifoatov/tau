//
//  LocationEntity.swift
//  Tau
//
//  Created by Iskander Foatov on 21.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

import Foundation
import CoreLocation

struct LocationEntity: Codable {
    
    public let id: String
    public let coordinates: Coordinates
    public let statuses: EvseStatus
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case coordinates = "coordinates"
        case statuses = "evse_statuses"
    }
    
}
