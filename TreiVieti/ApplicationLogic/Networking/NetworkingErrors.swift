//
//  NetworkingErrors.swift
//  TreiVieti
//
//  Created by Tudor Turcanu on 22/06/2019.
//  Copyright © 2019 Tudor Turcanu. All rights reserved.
//

import Foundation

enum AuthError: Error {
    case generalError
    case emailAlreadyTaken
    case invalidCredentials
}

enum ProfileError: Error {
    case generalError
    case noToken
}
