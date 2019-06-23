//
//  BloodGroupModel.swift
//  TreiVieti
//
//  Created by Ifrim Alexandru on 6/23/19.
//  Copyright © 2019 Tudor Turcanu. All rights reserved.
//

import Foundation

struct BloodGroupModel: Codable {
    let groupName: String
    let fillPercentage: Int
    
    init(_ groupName: String, fillPercentage: Int) {
        assert(groupName.count > 0)
        assert(fillPercentage >= 0 && fillPercentage <= 100)
        
        self.groupName = groupName
        self.fillPercentage = fillPercentage
    }
}
