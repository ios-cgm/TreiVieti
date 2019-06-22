//
//  HomeViewController.swift
//  TreiVieti
//
//  Created by Tudor Turcanu on 21/06/2019.
//  Copyright © 2019 CompuGroup Medical Software GmbH. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        view.window?.rootViewController = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController()
    }
}
