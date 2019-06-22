//
//  Validator.swift
//  TreiVieti
//
//  Created by Tudor Turcanu on 22/06/2019.
//  Copyright © 2019 Tudor Turcanu. All rights reserved.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
