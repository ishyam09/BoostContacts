//
//  ContactsEntity.swift
//  BoostContacts
//
//  Created by Jeelakarra Shyam on 21/10/19.
//  Copyright © 2019 Shyam. All rights reserved.
//

struct ContactsEntity {
    
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let phone: String
    
}


struct SaveContact: Codable {
    
    var id: String?
    var firstName: String?
    var lastName: String?
    var email: String?
    var phone: String?
    
}
