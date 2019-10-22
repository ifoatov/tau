//
//  ServiceInfo.swift
//  Tau
//
//  Created by Iskander Foatov on 22.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

import Foundation

struct ServiceInfo: Codable {
    
    let id: String
    let locationId: String
    let typeId: String
    let name: String
    let summary: String //description
    let price: Int
    let createdAt: String
    let updatedAt: String
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case locationId = "location_id"
        case typeId = "type_id"
        case name = "name"
        case summary = "description"
        case price = "price"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
