//
//  ConnectorType.swift
//  Tau
//
//  Created by Iskander Foatov on 27.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

import Foundation
import UIKit

enum ConnectorType: String, Codable {
    case type1 = "Type 1"
    case type2 = "Type 2"
    case cHAdeMO = "CHAdeMO"
    case ccs = "CCS"
    case schuko = "Schuko"
    
    public func image() -> UIImage? {
        switch self {
        case .type1:
            return UIImage(named: "type1")
        case .type2:
            return UIImage(named: "type2")
        case .cHAdeMO:
            return UIImage(named: "chademo")
        case .ccs:
            return UIImage(named: "ccs")
        case .schuko:
            return UIImage(named: "schuko")
            
        }
    }
}
