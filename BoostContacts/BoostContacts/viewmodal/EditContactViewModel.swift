//
//  EditContactViewModel.swift
//  BoostContacts
//
//  Created by Jeelakarra Shyam on 21/10/19.
//  Copyright © 2019 Shyam. All rights reserved.
//

import UIKit

struct EditContactViewModel {
    
    let imgColor: UIColor
    
    let viewBgColor: UIColor
    
    let mainTitle: String
    
    let firstNameTitle: String
    let firstNameValue: String
    
    let lastNameTitle: String
    let lastNameValue: String
    
    let subTitle: String
    
    let emailTitle: String
    let emailValue: String
    
    let phoneTitle: String
    let phoneValue: String
    
    let contactId : String
    
    init(entity: ContactsEntity) {
        imgColor = .orangeColor
        
        viewBgColor = .lightGray
        
        mainTitle = "Main Information"
        
        firstNameTitle = "First Name"
        firstNameValue =  entity.firstName
        
        lastNameTitle = "Last Name"
        lastNameValue = entity.lastName
        
        subTitle = "Sub Information"
        
        emailTitle = "Email"
        emailValue = entity.email
        
        phoneTitle = "Phone"
        phoneValue = entity.phone
        
        contactId = entity.id
        
    }
    
}
