//
//  LoginView.swift
//  Bankie
//
//  Created by Rituraj Mishra on 22/02/22.
//  Copyright © 2022 rtrjmishra. All rights reserved.
//

import Foundation
import UIKit

class LoginView : UIView
{
    //MARK: StackView
    let stackView = UIStackView()
    
    //MARK: DividingView
    let dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemFill
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    //MARK: Username
    let usernameTxtField:  UITextField = {
        let username = UITextField()
        username.translatesAutoresizingMaskIntoConstraints = false
        username.placeholder = "Username"
        return username
    }()
    
    //MARK: Password
    let passwordTxtField:  UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.isSecureTextEntry = true
        password.placeholder = "Password"
        return password
    }()
    
    override init(frame: CGRect)
    {
        super .init(frame: frame)
        
        style()
        layout()
    }

    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: -Extension
extension LoginView
{
    func style()
    {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 217.0/255.0, green: 217.0/255.0, blue: 217.0/255.0, alpha: 1.0)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        usernameTxtField.delegate = self
        passwordTxtField.delegate = self
        
        layer.cornerRadius = 10
        clipsToBounds = true
        
    }
    
    func layout()
    {
        stackView.addArrangedSubview(usernameTxtField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTxtField)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
            
        ])
    }
}


//MARK: -Extension
extension LoginView: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        usernameTxtField.endEditing(true)
        passwordTxtField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        return true
    }
}
