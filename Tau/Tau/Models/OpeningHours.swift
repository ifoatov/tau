//
//  OpeningHours.swift
//  Tau
//
//  Created by Iskander Foatov on 22.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

import Foundation

struct OpeningPeriods: Codable {
    
    let day: Int
    let opensAt: String
    let closesAt: String
    
    enum CodingKeys: String, CodingKey {
        case day = "day"
        case opensAt = "opens_at"
        case closesAt = "closes_at"
    }
}

struct OpeningHours: Codable {
    
    let isOpenNow: Bool
    let periods: Array<OpeningPeriods>
    
    enum CodingKeys: String, CodingKey {
        case isOpenNow = "open_now"
        case periods = "periods"
    }
}
