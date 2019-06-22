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
    @IBOutlet var emailPlaceholder: UILabel!
    @IBOutlet var passwordPlaceholder: UILabel!
    
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    let network = Networking()

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func unwindToLoginVC(segue: UIStoryboardSegue) {
        print("here")
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        setLoading(true)
        network.login(loginModel: LoginModel(email: email, password: password), success: { [weak self] in
            self?.view.window?.rootViewController = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController()
            self?.saveEmail(email)
        }) { [weak self] (error) in
            print(error.localizedDescription)
            self?.setLoading(false)
            self?.showErrorAlert()
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    func setLoading(_ loading: Bool) {
        let buttonTitle = loading ? nil : "LOGIN"
        loginButton.setTitle(buttonTitle, for: .normal)
        spinnerView.isHidden = !loading
        if loading {
            spinnerView.startAnimating()
        } else {
            spinnerView.stopAnimating()
        }
    }

    func showErrorAlert() {
        UIAlertController.showOKAlert(from: self, message: "Credentials are invalid. Please try again.")
    }
    func saveEmail(_ email: String) {
        UserDefaults.standard.setValue(email, forKey: "email")
        UserDefaults.standard.synchronize()
    }
    func setupUI() {
        spinnerView.stopAnimating()
        spinnerView.isHidden = true
        if let email = UserDefaults.standard.value(forKey: "email") as? String {
            emailTextField.text = email
        }
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
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == emailTextField {
            if let text = textField.text, text.isValidEmail() {
                emailPlaceholder.textColor = UIColor.gray
            } else {
                emailPlaceholder.textColor = UIColor.appRedColor
            }
        } else if textField == passwordTextField {
            if let text = textField.text, text.count == 1 && string.isEmpty {
                passwordPlaceholder.textColor = UIColor.appRedColor
            } else {
                passwordPlaceholder.textColor = UIColor.gray
            }
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
