//
//  DetailViewModel.swift
//  addressbook
//
//  Created by Vaghula Krishnan on 2020-08-29.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit

class DetailViewModel: NSObject {
    
    
    private var contact:Contacts!
    
    
    func setContact(contact:Contacts) {
        self.contact = contact
    }
    
    
    func getContactImage() -> UIImage? {
        if let imagedata = self.contact.image {
            return UIImage(data: imagedata)
        }
        return nil
    }
    
    func getContactName() -> String? {
        return self.contact.name
    }
    func getNumberOfSection() -> Int {
        var section = 0
        if self.contact.phone != nil {
            section += 1
        }
        if self.contact.email != nil {
            section += 1
        }
        return section
    }
    
    func getNumberOfRows(at section:Int) -> Int {
        if section == 0 {
            return self.contact.phone?.count ?? 0
        }else if section == 1{
            return self.contact.email?.count ?? 0
        }
        return 0
    }
    
    func getHeaderTitle(for section:Int) -> String? {
        
        if section == 0 {
            return "Phone"
        }else if section == 1{
            return "Email"
        }
        return nil
    }
    
    func getContent(for indexPath:IndexPath) -> String? {
        if indexPath.section == 0 {
            return self.contact.phone![indexPath.item]
        }else if indexPath.section == 1{
            return self.contact.email![indexPath.item]
        }
        return nil
    }
    
        
}
