//
//  RegisterModel.swift
//  TreiVieti
//
//  Created by Tudor Turcanu on 22/06/2019.
//  Copyright © 2019 Tudor Turcanu. All rights reserved.
//

import Foundation

struct RegisterModel: Codable {
    let email: String
    let name: String
    let phoneNumber: String
    let password: String
    private enum CodingKeys: String, CodingKey {
        case email = "email"
        case name = "name"
        case phoneNumber = "phone_number"
        case password = "password"
    }
}
