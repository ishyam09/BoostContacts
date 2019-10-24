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
        
        contactListCollectionView.populateData()
        contactListCollectionView.reloadData()
        
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
    
    // parsing local json
    func displayContactList() {
        let path = Bundle.main.path(forResource: "data" , ofType: "json")
        let url = URL(fileURLWithPath: path ?? "Check path variable")
        
        var contactListEntity = [ContactsEntity]()
        
        do {
            let data = try Data(contentsOf: url)
            let contactsModel = try JSONDecoder().decode([ContactsModel].self, from: data)
            
            for contact in contactsModel {
                
                let contactEntity = ContactsEntity.init(id: contact.id ?? "", firstName: contact.firstName ?? "", lastName: contact.lastName ?? "", email: contact.email ?? "", phone: contact.phone ?? "")
                
                contactListEntity.append(contactEntity)
            }
            
            Global.dataFactory.setContactsEntity(contactListEntity)
        } catch {
            print("try block error: \(error)")
        }
    }
    
    private func prepareNavBar() {
        let addButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBtnTapped))
        addButtonItem.tintColor = .orangeColor
        
        navigationItem.rightBarButtonItems = [addButtonItem]
    }
    
    @objc func addBtnTapped() {
        Global.dataFactory.setSelectedContactEntity(nil)
        
        push(controller: EditContactViewController())
    }

    func goToEditContact(_ contactEnity: ContactsEntity) {
        Global.dataFactory.setSelectedContactEntity(contactEnity)
        
        push(controller: EditContactViewController())
    }
    
}
