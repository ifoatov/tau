//
//  Connector.swift
//  Tau
//
//  Created by Iskander Foatov on 22.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

import Foundation

struct Parking: Codable  {
    let car: Bool
    let bike: Bool
}

struct Connector: Codable {
    
    let id: String
    let locationId: String
    let type: ConnectorType
    let power: Double
    let current: String // TODO find out what is it
    let stationId: String
    let evseNumber: Int
    let number: Int
    let status: String // TODO create enum
    let statusUpdatedAt: String
    let operational: Bool
    // TODO: ask type of parking
//    let parking: Parking?
    let feePerMinute: Int
    let stationNumber: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case locationId = "location_id"
        case type = "type"
        case power = "power"
        case current = "current"
        case stationId = "station_id"
        case evseNumber = "evse_number"
        case number = "number"
        case status = "status"
        case statusUpdatedAt = "status_updated_at"
        case operational = "operational"
//        case parking = "parking"
        case feePerMinute = "fee_per_minute"
        case stationNumber = "station_number"
        
        
    }
}
