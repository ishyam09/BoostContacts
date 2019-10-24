//
//  EditContactView.swift
//  BoostContacts
//
//  Created by Jeelakarra Shyam on 21/10/19.
//  Copyright © 2019 Shyam. All rights reserved.
//

import UIKit

class EditContactView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var item = EditContactViewModel(entity: Global.dataFactory.getSelectedContactEntity())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        populateData()
    }
    
    private let scrollViewContentSize: CGFloat = 700
    
    private let scrollView = UIScrollView()
    private let container = UIView()
    
    private let profilePicHolder = UIView()
    let profilePic: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    let inputViewHolder = InputViewHolder()
    
    func setupViews() {
        backgroundColor = .white
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize.height = scrollViewContentSize
        
        profilePic.roundedView(withHeight: 100)
        profilePicHolder.addSubview(profilePic)
        
        [profilePicHolder, inputViewHolder].forEach{ container.addSubview($0) }
        
        scrollView.addSubview(container)
        
        addSubview(scrollView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraints()
    }
    
    func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        container.translatesAutoresizingMaskIntoConstraints = false
        
        profilePicHolder.translatesAutoresizingMaskIntoConstraints = false
        
        inputViewHolder.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeTopAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeLeadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeTrailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeBottomAnchor),
            
            container.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            container.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            profilePicHolder.topAnchor.constraint(equalTo: container.safeTopAnchor),
            profilePicHolder.leadingAnchor.constraint(equalTo: container.safeLeadingAnchor),
            profilePicHolder.trailingAnchor.constraint(equalTo: container.safeTrailingAnchor),
            profilePicHolder.heightAnchor.constraint(equalToConstant: 150),
            
            profilePic.centerXAnchor.constraint(equalTo: profilePicHolder.safeCenterXAnchor),
            profilePic.centerYAnchor.constraint(equalTo: profilePicHolder.safeCenterYAnchor),
            profilePic.heightAnchor.constraint(equalToConstant: 100),
            profilePic.widthAnchor.constraint(equalToConstant: 100),
            
            inputViewHolder.topAnchor.constraint(equalTo: profilePicHolder.safeBottomAnchor),
            inputViewHolder.leadingAnchor.constraint(equalTo: container.safeLeadingAnchor),
            inputViewHolder.trailingAnchor.constraint(equalTo: container.safeTrailingAnchor),
            inputViewHolder.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    func populateData() {
        profilePic.backgroundColor = item.imgColor

        inputViewHolder.mainTitleLabel.text = item.mainTitle
        inputViewHolder.mainTitleHolder.backgroundColor = item.viewBgColor

        inputViewHolder.firstNameLabel.text = item.firstNameTitle
        inputViewHolder.firstNameTextField.text = item.firstNameValue
        
        inputViewHolder.separatorView1.backgroundColor = item.viewBgColor
        
        inputViewHolder.lastNameLabel.text = item.lastNameTitle
        inputViewHolder.lastNameTextField.text = item.lastNameValue
        
        inputViewHolder.subTitleLabel.text = item.subTitle
        inputViewHolder.subTitleHolder.backgroundColor = item.viewBgColor
        
        inputViewHolder.emailLabel.text = item.emailTitle
        inputViewHolder.emailTextField.text = item.emailValue
        
        inputViewHolder.separatorView2.backgroundColor = item.viewBgColor
        
        inputViewHolder.phoneLabel.text = item.phoneTitle
        inputViewHolder.phoneTextField.text = item.phoneValue

    }
    
}
