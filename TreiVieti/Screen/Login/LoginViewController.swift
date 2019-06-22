//
//  LoginViewController.swift
//  TreiVieti
//
//  Created by Tudor Turcanu on 21/06/2019.
//  Copyright © 2019 CompuGroup Medical Software GmbH. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func unwindToLoginVC(segue: UIStoryboardSegue) {
        print("here")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}


class NibLoadingView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let nib = UINib.init(nibName: String(describing: type(of: self)), bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return nil
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.leftAnchor.constraint(equalTo: self.leftAnchor),
            view.rightAnchor.constraint(equalTo: self.rightAnchor)
            ])
    }
}
