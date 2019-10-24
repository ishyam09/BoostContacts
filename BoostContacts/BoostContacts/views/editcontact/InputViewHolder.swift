//
//  InputViewHolder.swift
//  BoostContacts
//
//  Created by Jeelakarra Shyam on 24/10/19.
//  Copyright © 2019 Shyam. All rights reserved.
//

import UIKit

class InputViewHolder: UIView, UITextFieldDelegate {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    let mainTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 16)
        lbl.adjustsFontSizeToFitWidth = true
        
        return lbl
    }()
    let mainTitleHolder = UIView()
    
    let firstNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.adjustsFontSizeToFitWidth = true
        
        return lbl
    }()
    
    let firstNameTextField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle = .roundedRect
        
        return tf
    }()
    
    let lastNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.adjustsFontSizeToFitWidth = true
        
        return lbl
    }()
    
    let lastNameTextField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle = .roundedRect
        
        return tf
    }()
    
    let subTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 16)
        lbl.adjustsFontSizeToFitWidth = true
        
        return lbl
    }()
    let subTitleHolder = UIView()
    
    let emailLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.adjustsFontSizeToFitWidth = true
        
        return lbl
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle = .roundedRect
        
        return tf
    }()
    
    let phoneLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.adjustsFontSizeToFitWidth = true
        
        return lbl
    }()
    
    let phoneTextField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle = .roundedRect
        
        return tf
    }()
    
    let separatorView1 = UIView()
    let separatorView2 = UIView()
    
    func setupViews() {
        
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        
        emailTextField.delegate = self
        phoneTextField.delegate = self
        
        mainTitleHolder.addSubview(mainTitleLabel)
        subTitleHolder.addSubview(subTitleLabel)
        
        [mainTitleHolder, firstNameLabel, firstNameTextField, separatorView1, lastNameLabel, lastNameTextField, subTitleHolder, emailLabel, emailTextField, separatorView2, phoneLabel, phoneTextField].forEach{ addSubview($0) }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        mainTitleHolder.translatesAutoresizingMaskIntoConstraints = false
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        separatorView1.translatesAutoresizingMaskIntoConstraints = false
        
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleHolder.translatesAutoresizingMaskIntoConstraints = false
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        separatorView2.translatesAutoresizingMaskIntoConstraints = false
        
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainTitleLabel.topAnchor.constraint(equalTo: mainTitleHolder.safeTopAnchor),
            mainTitleLabel.leadingAnchor.constraint(equalTo: mainTitleHolder.safeLeadingAnchor, constant: 10),
            mainTitleLabel.trailingAnchor.constraint(equalTo: mainTitleHolder.safeTrailingAnchor, constant: -10),
            mainTitleLabel.bottomAnchor.constraint(equalTo: mainTitleHolder.safeBottomAnchor),
            
            mainTitleHolder.topAnchor.constraint(equalTo: safeTopAnchor),
            mainTitleHolder.leadingAnchor.constraint(equalTo: safeLeadingAnchor),
            mainTitleHolder.trailingAnchor.constraint(equalTo: safeTrailingAnchor),
            mainTitleHolder.heightAnchor.constraint(equalToConstant: 30),
            
            firstNameLabel.topAnchor.constraint(equalTo: mainTitleHolder.bottomAnchor, constant: 10),
            firstNameLabel.leadingAnchor.constraint(equalTo: safeLeadingAnchor, constant: 10),
            firstNameLabel.heightAnchor.constraint(equalToConstant: 40),
            firstNameLabel.widthAnchor.constraint(equalToConstant: 80),
            
            firstNameTextField.topAnchor.constraint(equalTo: mainTitleHolder.bottomAnchor, constant: 10),
            firstNameTextField.leadingAnchor.constraint(equalTo: firstNameLabel.safeTrailingAnchor, constant: 5),
            firstNameTextField.trailingAnchor.constraint(equalTo: safeTrailingAnchor, constant: -10),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            separatorView1.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 5),
            separatorView1.leadingAnchor.constraint(equalTo: safeLeadingAnchor),
            separatorView1.trailingAnchor.constraint(equalTo: safeTrailingAnchor),
            separatorView1.heightAnchor.constraint(equalToConstant: 1),
            
            lastNameLabel.topAnchor.constraint(equalTo: separatorView1.bottomAnchor, constant: 10),
            lastNameLabel.leadingAnchor.constraint(equalTo: safeLeadingAnchor, constant: 10),
            lastNameLabel.heightAnchor.constraint(equalToConstant: 40),
            lastNameLabel.widthAnchor.constraint(equalToConstant: 80),
            
            lastNameTextField.topAnchor.constraint(equalTo: separatorView1.bottomAnchor, constant: 10),
            lastNameTextField.leadingAnchor.constraint(equalTo: lastNameLabel.safeTrailingAnchor, constant: 5),
            lastNameTextField.trailingAnchor.constraint(equalTo: safeTrailingAnchor, constant: -10),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            subTitleLabel.topAnchor.constraint(equalTo: subTitleHolder.safeTopAnchor),
            subTitleLabel.leadingAnchor.constraint(equalTo: subTitleHolder.safeLeadingAnchor, constant: 10),
            subTitleLabel.trailingAnchor.constraint(equalTo: subTitleHolder.safeTrailingAnchor, constant: 10),
            subTitleLabel.bottomAnchor.constraint(equalTo: subTitleHolder.safeBottomAnchor),
            
            subTitleHolder.topAnchor.constraint(equalTo: lastNameLabel.safeBottomAnchor, constant: 10),
            subTitleHolder.leadingAnchor.constraint(equalTo: safeLeadingAnchor),
            subTitleHolder.trailingAnchor.constraint(equalTo: safeTrailingAnchor),
            subTitleHolder.heightAnchor.constraint(equalToConstant: 30),
            
            emailLabel.topAnchor.constraint(equalTo: subTitleHolder.bottomAnchor, constant: 10),
            emailLabel.leadingAnchor.constraint(equalTo: safeLeadingAnchor, constant: 10),
            emailLabel.heightAnchor.constraint(equalToConstant: 40),
            emailLabel.widthAnchor.constraint(equalToConstant: 80),
            
            emailTextField.topAnchor.constraint(equalTo: subTitleHolder.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.safeTrailingAnchor, constant: 5),
            emailTextField.trailingAnchor.constraint(equalTo: safeTrailingAnchor, constant: -10),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            separatorView2.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
            separatorView2.leadingAnchor.constraint(equalTo: safeLeadingAnchor),
            separatorView2.trailingAnchor.constraint(equalTo: safeTrailingAnchor),
            separatorView2.heightAnchor.constraint(equalToConstant: 1),
            
            phoneLabel.topAnchor.constraint(equalTo: separatorView2.bottomAnchor, constant: 10),
            phoneLabel.leadingAnchor.constraint(equalTo: safeLeadingAnchor, constant: 10),
            phoneLabel.heightAnchor.constraint(equalToConstant: 40),
            phoneLabel.widthAnchor.constraint(equalToConstant: 80),
            
            phoneTextField.topAnchor.constraint(equalTo: separatorView2.bottomAnchor, constant: 10),
            phoneTextField.leadingAnchor.constraint(equalTo: phoneLabel.safeTrailingAnchor, constant: 5),
            phoneTextField.trailingAnchor.constraint(equalTo: safeTrailingAnchor, constant: -10),
            phoneTextField.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    
}

extension InputViewHolder {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case firstNameTextField:
            firstNameTextField.resignFirstResponder()
            lastNameTextField.becomeFirstResponder()
            
            break
        case lastNameTextField:
            lastNameTextField.resignFirstResponder()
            emailTextField.becomeFirstResponder()
            
            break
        case emailTextField:
            emailTextField.resignFirstResponder()
            phoneTextField.becomeFirstResponder()
            
            break
        case phoneTextField:
            phoneTextField.resignFirstResponder()
            
            break
        default:
            break
        }
        
        return false
    }
    
}

