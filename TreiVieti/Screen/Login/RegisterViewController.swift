//
//  RegisterViewController.swift
//  TreiVieti
//
//  Created by Daniel Munteanu on 22/06/2019.
//  Copyright © 2019 Tudor Turcanu. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var confirmEmailAddress: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var createAccountButton: UIButton!

    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    let network = Networking()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func createAccountButtonTapped(_ sender: Any) {
        guard let email = emailAddressTextField.text, let confirmEmail = confirmEmailAddress.text, let password = passwordTextField.text else {
            UIAlertController.showOKAlert(from: self, message: "Please enter all required fields.")
            return
        }
        guard email == confirmEmail else {
            UIAlertController.showOKAlert(from: self, message: "Email addresses don't match.")
            return
        }
        guard password.count > 3 else {
            UIAlertController.showOKAlert(from: self, message: "Password should have at least 3 characters.")
            return
        }
        setLoading(true)
        network.register(registerModel: RegisterModel(email: email, name: email, phoneNumber: "0741123123", password: password), success: { [weak self] in
            self?.network.login(loginModel: LoginModel(email: email, password: password), success: { [weak self] in
                self?.view.window?.rootViewController = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController()
                self?.saveEmail(email)
            }, failure: { [weak self] (error) in
                self?.showErrorOnRegister("Something went wrong. Please try again.")
                self?.setLoading(false)
            })
        }) { [weak self] (error) in
            if error == AuthError.emailAlreadyTaken {
                self?.showErrorOnRegister("The email has already been taken.")
            } else {
                self?.showErrorOnRegister("Something went wrong. Please try again.")
            }
            self?.setLoading(false)
        }
    }

    func saveEmail(_ email: String) {
        UserDefaults.standard.setValue(email, forKey: "email")
        UserDefaults.standard.synchronize()
    }

    func setupUI() {
        spinnerView.isHidden = true
        spinnerView.stopAnimating()
    }

    func showErrorOnRegister(_ msg: String) {
        UIAlertController.showOKAlert(from: self, message: msg)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    func setLoading(_ loading: Bool) {
        let buttonTitle = loading ? nil : "LOGIN"
        createAccountButton.setTitle(buttonTitle, for: .normal)
        spinnerView.isHidden = !loading
        if loading {
            spinnerView.startAnimating()
        } else {
            spinnerView.stopAnimating()
        }
    }
}
