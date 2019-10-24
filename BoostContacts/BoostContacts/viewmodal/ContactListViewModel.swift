//
//  ContactListViewModel.swift
//  BoostContacts
//
//  Created by Jeelakarra Shyam on 21/10/19.
//  Copyright © 2019 Shyam. All rights reserved.
//

import UIKit

struct ContactListViewModel {
    var imgColor: UIColor
    var labelTitle: String
    
    let firstName: String
    let lastName: String
    
    init(items: ContactsEntity) {
        imgColor = .orangeColor
        
        firstName = items.firstName
        lastName = items.lastName
        
        labelTitle = "\(firstName) \(lastName)"
    }
}

struct ContactListModel {
    let model: ContactsEntity
}
