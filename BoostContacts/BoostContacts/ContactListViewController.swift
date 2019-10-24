//
//  ContactListViewController.swift
//  BoostContacts
//
//  Created by Jeelakarra Shyam on 21/10/19.
//  Copyright © 2019 Shyam. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController {
    
    private let profileImageView = UIImageView()
    private let profileImageViewSize: CGFloat = 50

    let contactListCollectionView = ContactListCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.backgroundColor = .white
        
        displayContactList()
        
        contactListCollectionView.backgroundColor = .gray
        contactListCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(contactListCollectionView)
        
        prepareNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        contactListCollectionView.isPullDownToRefreshEnabled = true
        
        NSLayoutConstraint.activate([
            contactListCollectionView.topAnchor.constraint(equalTo: self.view.safeTopAnchor, constant: 0),
            contactListCollectionView.leadingAnchor.constraint(equalTo: self.view.safeLeadingAnchor, constant: 0),
            contactListCollectionView.bottomAnchor.constraint(equalTo: self.view.safeBottomAnchor, constant: 0),
            contactListCollectionView.trailingAnchor.constraint(equalTo: self.view.safeTrailingAnchor, constant: 0)
        ])
    }
    
    // parsing data from json
    func displayContactList() {
        
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let destURL = documentsURL!.appendingPathComponent("data").appendingPathExtension("json")
        var contactListEntity = [ContactsEntity]()
        do {
            let data = try Data(contentsOf: destURL)
            let contactsModel = try JSONDecoder().decode([ContactsModel].self, from: data)
            for contact in contactsModel {
                let contactEntity = ContactsEntity.init(id: contact.id ?? "", firstName: contact.firstName ?? "", lastName: contact.lastName ?? "", email: contact.email ?? "", phone: contact.phone ?? "")
                contactListEntity.append(contactEntity)
            }
            Global.dataFactory.setContactsEntity(contactListEntity)
        } catch {
            print("try block error: \(error)")
        }
        
        contactListCollectionView.populateData()
        contactListCollectionView.reloadData()
    }
    
    private func prepareNavBar() {
        let addButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBtnTapped))
        addButtonItem.tintColor = .orangeColor
        
        navigationItem.rightBarButtonItems = [addButtonItem]
    }
    
    @objc func addBtnTapped() {
        self.goToEditContact(nil)
    }

    func goToEditContact(_ contactEnity: ContactsEntity?) {
        Global.dataFactory.setSelectedContactEntity(contactEnity)
        
        let editController =  EditContactViewController()
        editController.saveCompletion = {
            self.displayContactList()
        }
        push(controller: editController)
    }
    
}
