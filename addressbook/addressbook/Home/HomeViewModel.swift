//
//  HomeViewModel.swift
//  addressbook
//
//  Created by Vaghula Krishnan on 2020-08-28.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit

class HomeViewModel: NSObject {

    private var arrayContact:[Contacts] = []
    weak var delegate: ModelDelegate?
    
    func populateContacts() {
        HelperContacts.shared.retrieveAllContacts { (contacts) in
            DispatchQueue.main.async {
                if let temp = contacts {
                    self.arrayContact = temp
                    self.delegate?.recievedResponce(refparam: .ContactsList)
                }else{
                    self.delegate?.errorResponce(refparam: .ContactsList)
                }
            }
        }
    }
    
    func getNumberOfRows() -> Int {
        return arrayContact.count
    }

    func getContact(for indexpath:IndexPath) -> Contacts {
        return arrayContact[indexpath.item]
    }
}
