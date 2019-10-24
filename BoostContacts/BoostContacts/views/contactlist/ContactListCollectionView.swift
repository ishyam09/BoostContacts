//
//  ContactListCollectionView.swift
//  BoostContacts
//
//  Created by Jeelakarra Shyam on 21/10/19.
//  Copyright © 2019 Shyam. All rights reserved.
//

import UIKit

class ContactListCollectionView: BaseCollectionView<ContactListCollectionCell, ContactListViewModel>, UICollectionViewDelegateFlowLayout {
    
    override func refreshData() {
        self.reloadData()
    }
    
    func populateData() {
        items = Global.dataFactory.getContactsEntity().map {ContactListViewModel(items: $0)}
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let tvc = UIApplication.topViewController() as? ContactListViewController else {
            print("Top View Controller is not ViewController")
            
            return
        }
        
        tvc.goToEditContact(Global.dataFactory.getContactsEntity()[indexPath.row])
    }
    
}
