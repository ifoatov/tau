//
//  EvseStatus.swift
//  Tau
//
//  Created by Iskander Foatov on 22.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

import Foundation

struct EvseStatus: Codable {
    
    let available: Int
    let busy: Int
    let offline: Int
    let faulted: Int
    
}
