//
//  LoginViewController.swift
//  Bankie
//
//  Created by Rituraj Mishra on 22/02/22.
//

import UIKit

class LoginViewController: UIViewController
{
    //MARK: LoginView
    let loginView = LoginView()
    
    //MARK: SignIn Button
    let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.configuration?.imagePadding = 8
        button.setTitle("Sign In", for: [])
        return button
    }()
    
    //MARK: Error MEssage Label
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemRed
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    //MARK: Username and password
    var username: String? {
        return loginView.usernameTxtField.text
    }
    var password: String? {
        return loginView.passwordTxtField.text
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        style()
        layout()
    }
}

//MARK: -Extension
extension LoginViewController
{
    private func style()
    {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
    }
    
    private func layout()
    {
        view.addSubview(loginView)
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        view.addSubview(signInButton)
        NSLayoutConstraint.activate([
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor),
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2)
        ])
        
        view.addSubview(errorMessageLabel)
        NSLayoutConstraint.activate([
            errorMessageLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: signInButton.leadingAnchor, multiplier: 0),
            signInButton.trailingAnchor.constraint(equalToSystemSpacingAfter: errorMessageLabel.trailingAnchor, multiplier: 0),
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2)
        ])
        
    }
}

//MARK: -Actions
extension LoginViewController
{
    @objc func signInTapped(sender: UIButton)
    {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login()
    {
        guard let username = username, let password = password else {
           assertionFailure("Username / Password cannot be nil!")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / Password cannot be blank!")
            return
        }
        
        if username == "Sam" && password == "123" {
            signInButton.configuration?.showsActivityIndicator = true
        }else{
            configureView(withMessage: "Incorrect username / password!")
        }
    }
    
    private func configureView(withMessage message: String)
    {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
