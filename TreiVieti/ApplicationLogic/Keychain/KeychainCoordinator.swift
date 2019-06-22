//
//  KeychainCoordinator.swift
//  TreiVieti
//
//  Created by Tudor Turcanu on 22/06/2019.
//  Copyright © 2019 Tudor Turcanu. All rights reserved.
//

import Foundation
import KeychainAccess

class KeychainCoordinator {
    static var `default`: Keychain {
        return Keychain(service: "com.cgm.treivieti.TreiVieti")
    }
    static func saveToken(token: String) {
        KeychainCoordinator.default["token"] = token
    }
    static var token: String? {
        return KeychainCoordinator.default["token"]
    }
}
