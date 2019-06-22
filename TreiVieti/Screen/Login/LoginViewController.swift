//
//  LoginViewController.swift
//  TreiVieti
//
//  Created by Tudor Turcanu on 21/06/2019.
//  Copyright © 2019 CompuGroup Medical Software GmbH. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    let network = Networking()

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.text = "tudor1@gmail.com"
        passwordTextField.text = "123456"
    }

    @IBAction func unwindToLoginVC(segue: UIStoryboardSegue) {
        print("here")
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        network.login(loginModel: LoginModel(email: email, password: password), success: { [weak self] in
            self?.view.window?.rootViewController = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
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

extension UIAlertController {
    @discardableResult
    static func showOKAlert(from viewController: UIViewController, message: String, title: String? = "", completion: (() -> Void)? = nil) -> UIAlertController {
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
        return alertController
    }
}
