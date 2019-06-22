//
//  RegisterViewController.swift
//  TreiVieti
//
//  Created by Daniel Munteanu on 22/06/2019.
//  Copyright © 2019 Tudor Turcanu. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
