//
//  PhotoInfo.swift
//  Tau
//
//  Created by Iskander Foatov on 22.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

import Foundation

struct PhotoInfo: Codable {
    let id: String
    let url: String
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case url = "url"
        case createdAt = "created_at"
    }
}
