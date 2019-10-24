//
//  EditContactViewController.swift
//  BoostContacts
//
//  Created by Jeelakarra Shyam on 21/10/19.
//  Copyright © 2019 Shyam. All rights reserved.
//

import UIKit

class EditContactViewController: UIViewController {
    
    var saveCompletion : (() -> Void)?
    
    private let editContactView = EditContactView()
    
    lazy var viewModel : ContactEditViewModel = {
        return ContactEditViewModel()
    }()
    
    var saveContact: SaveContact?
    
    var isContactExist:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareNavBar()
        
        self.isContactExist = true
        
        self.view.addSubview(editContactView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        editContactView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editContactView.topAnchor.constraint(equalTo: self.view.safeTopAnchor),
            editContactView.leadingAnchor.constraint(equalTo: self.view.safeLeadingAnchor),
            editContactView.trailingAnchor.constraint(equalTo: self.view.safeTrailingAnchor),
            editContactView.bottomAnchor.constraint(equalTo: self.view.safeBottomAnchor)
        ])
    }
    
    private func prepareNavBar() {
        let cancelButton: UIButton = UIButton(type: .custom)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.orangeColor, for: .normal)
        cancelButton.titleLabel?.adjustsFontSizeToFitWidth = true
        cancelButton.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        cancelButton.addTarget(self, action: #selector(cancelBtnTapped), for: .touchUpInside)
        
        let cancelButtonItem = UIBarButtonItem(customView: cancelButton)
        self.navigationItem.leftBarButtonItems = [cancelButtonItem]
        
        
        let saveButton: UIButton = UIButton(type: .custom)
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.orangeColor, for: .normal)
        saveButton.titleLabel?.adjustsFontSizeToFitWidth = true
        saveButton.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        saveButton.addTarget(self, action: #selector(saveBtnTapped), for: .touchUpInside)
        
        let saveButtonItem = UIBarButtonItem(customView: saveButton)
        self.navigationItem.rightBarButtonItems = [saveButtonItem]
    }
    
    @objc private func cancelBtnTapped() {
        pop()
    }
    
    @objc private func saveBtnTapped() {
        validateTextFields()
    }
    
}


extension EditContactViewController {
    
    func validateTextFields() {
        
        guard let firstName = editContactView.inputViewHolder.firstNameTextField.text else {
            print("First Name field is empty")
            
            return
        }
        
        guard let lastName = editContactView.inputViewHolder.lastNameTextField.text else {
            print("Last Name field is empty")
            
            return
        }
        
        guard let email = editContactView.inputViewHolder.emailTextField.text else {
            print("Last Name field is empty")
            
            return
        }
        
        guard let phone = editContactView.inputViewHolder.phoneTextField.text else {
            print("Last Name field is empty")
            
            return
        }
        
        if (firstName.isEmpty || lastName.isEmpty) || (firstName.hasPrefix(" ") || lastName.hasPrefix(" ")) {
            let alert = UIAlertController(title: "Alert", message: "First Name or Last Name is empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else {
            self.saveContact = SaveContact()
            
            if editContactView.item.contactId.count == 0 {
                isContactExist = false
                self.saveContact?.id = Global.shared.randomString(length: 24)
            } else {
                self.saveContact?.id = editContactView.item.contactId
            }
            
            self.saveContact?.firstName = firstName
            self.saveContact?.lastName = lastName
            
            if email.isValidEmail != false {
                self.saveContact?.email = email
            }
            
            self.saveContact?.phone = phone
            
            self.viewModel.saveContacts(fileName: "data", contactObj: self.saveContact ?? SaveContact() , isExist: isContactExist)
            
            if let saveComp = saveCompletion{
                saveComp()
            }
            
            pop()
        }
    }
    
}

class ContactEditViewModel: NSObject {
    
    func find(value searchValue: SaveContact, in array: [SaveContact]) -> Int?
    {
        for (index, value) in array.enumerated()
        {
            if value.id == searchValue.id {
                return index
            }
        }
        
        return nil
    }
    
    func saveContacts(fileName: String, contactObj: SaveContact, isExist: Bool) {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let destURL = documentsURL!.appendingPathComponent(fileName).appendingPathExtension("json").standardizedFileURL
        
        do {
            let data = try Data(contentsOf: destURL)
            let decoder = JSONDecoder()
            var jsonData = try decoder.decode([SaveContact].self, from: data) as [SaveContact]
            if isExist {
                if let index = find(value: contactObj, in: jsonData) {
                    print("Contact index is \(index)")
                    jsonData[index] = contactObj
                }
            } else {
                jsonData.append(contactObj)
            }
            
            saveToFile(contactList: jsonData, fileName: fileName)
            
        } catch {
            print("error:\(error)")
        }
    }
    
    func saveToFile(contactList:[SaveContact], fileName: String) {
        
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let destURL = documentsURL!.appendingPathComponent(fileName).appendingPathExtension("json")
        
        do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(contactList)
            try jsonData.write(to: destURL)
        } catch {
            /* error handling here */
            print("error:\(error)")
        }
    }
    
}

