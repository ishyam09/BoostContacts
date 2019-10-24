//
//  DataFactory.swift
//  BoostContacts
//
//  Created by Jeelakarra Shyam on 21/10/19.
//  Copyright © 2019 Shyam. All rights reserved.
//

class DataFactory {
    
    // to avoid multiple instance
    static let shared = {
        return DataFactory()
    }()
    
    private var contactsEntity: [ContactsEntity]?
    private var selectedContactEntity: ContactsEntity?
    
    func getContactsEntity() -> [ContactsEntity] {
        return contactsEntity ?? [ContactsEntity]()
    }
    func setContactsEntity(_ entity: [ContactsEntity]) {
        if entity.count != 0 {
            contactsEntity = entity
        }
    }
    
    func getSelectedContactEntity() -> ContactsEntity {
        guard let contactEntity = selectedContactEntity else {
            //print("Contact entity is nil")
            
            return ContactsEntity(id: "", firstName: "", lastName: "", email: "", phone: "")
        }
        
        return contactEntity
    }
    func setSelectedContactEntity(_ entity: ContactsEntity?) {
        selectedContactEntity = entity
    }
    
}
