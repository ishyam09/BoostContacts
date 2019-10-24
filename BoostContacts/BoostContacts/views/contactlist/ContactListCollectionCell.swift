//
//  ContactListCollectionCell.swift
//  BoostContacts
//
//  Created by Jeelakarra Shyam on 21/10/19.
//  Copyright © 2019 Shyam. All rights reserved.
//

import UIKit

class ContactListCollectionCell: BaseCollectionCell<ContactListViewModel> {
    
    override var item: ContactListViewModel! {
        didSet{
            profilePic.backgroundColor = item.imgColor
            
            titleLabel.text = item.labelTitle
        }
    }
    
    let profilePic: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 16)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        profilePic.roundedView(withHeight: 50)
        
        [profilePic, titleLabel].forEach{ addSubview($0) }
    }
    
    override func setupConstraints() {
        
        NSLayoutConstraint.activate([
            profilePic.topAnchor.constraint(equalTo: self.safeTopAnchor, constant: 10),
            profilePic.leadingAnchor.constraint(equalTo: self.safeLeadingAnchor, constant: 10),
            profilePic.widthAnchor.constraint(equalToConstant: 50),
            profilePic.heightAnchor.constraint(equalToConstant: 50),

            titleLabel.topAnchor.constraint(equalTo: self.safeTopAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: profilePic.trailingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: self.safeTrailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}
