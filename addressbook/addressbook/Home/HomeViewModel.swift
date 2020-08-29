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
    private var arrayfilterContact:[Contacts] = []
    private var isFilteredResults = false
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
    
    func populateFilteredContact(keyword:String) {
        if keyword == "" {
            isFilteredResults = false
            arrayfilterContact.removeAll()
            self.delegate?.recievedResponce(refparam: .ContactsList)
        }else{
            isFilteredResults = true
            arrayfilterContact = arrayContact.filter{ (contact:Contacts) -> Bool in
                return contact.name!.lowercased().contains(keyword.lowercased())
            }
            self.delegate?.recievedResponce(refparam: .ContactsSearch)
        }
        
    }
    
    func getNumberOfRows() -> Int {
        if isFilteredResults {
            return arrayfilterContact.count
        }
        return arrayContact.count
    }

    func getContact(for indexpath:IndexPath) -> Contacts {
        if isFilteredResults {
            return arrayfilterContact[indexpath.item]
        }
        return arrayContact[indexpath.item]
    }
}
