//
//  ContactsModel.swift
//  BoostContacts
//
//  Created by Jeelakarra Shyam on 21/10/19.
//  Copyright © 2019 Shyam. All rights reserved.
//

struct ContactsModel: Decodable {
    
    let id: String?
    let firstName: String?
    let lastName: String?
    let email: String?
    let phone: String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case firstName = "firstName"
        case lastName = "lastName"
        case email = "email"
        case phone = "phone"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
    }
    
}
