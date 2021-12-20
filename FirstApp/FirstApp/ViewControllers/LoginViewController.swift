//
//  LoginViewController.swift
//  FirstApp
//
//  Created by Гоша on 20.12.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var viewUnderSignIn: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func unwindToMain(unwindSegue: UIStoryboardSegue) -> Void { }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewUnderSignIn.layer.cornerRadius = 15
        usernameTextField.text = "admin"
        passwordTextField.text = "123456"
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        print(#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWasShown),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        navigationController?.navigationBar.isHidden = true
        
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        navigationController?.navigationBar.isHidden = false

        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    
    // MARK: - Actions
    @objc func hideKeyboard() -> Void {
        self.scrollView?.endEditing(true)
    }


    @objc func keyboardWasShown(notification: Notification) -> Void {

        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
        UIView.animate(withDuration: 1) {
            self.scrollView.constraints
                .first(where: {$0.identifier == "KeyboardShown"})?
                .priority = .required
            self.scrollView.constraints
                .first(where: {$0.identifier == "KeyboardHide"})?
                .priority = .defaultHigh
            self.view.layoutIfNeeded()
        }
    }

    @objc func keyboardWillBeHidden(notification: Notification) -> Void {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        UIView.animate(withDuration: 1) {
            self.scrollView.constraints
                .first(where: {$0.identifier == "KeyboardShown"})?
                .priority = .defaultHigh
            self.scrollView.constraints
                .first(where: {$0.identifier == "KeyboardHide"})?
                .priority = .required
            self.view.layoutIfNeeded()
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "goToMain":
            if checkUser() {
                clearData()
                return true
            } else {
                presentAlert()
                return false
            }
        default:
            return false
        }
    }
    
    // MARK: - Private methods
    private func checkUser() -> Bool {
        usernameTextField.text == "admin" && passwordTextField.text == "123456"
    }
    
    private func presentAlert() -> Void {
        let alertController = UIAlertController(
            title: "Error",
            message: "You have entered incorrect username or password.",
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    private func clearData() -> Void {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}

