//
//  HelperContacts.swift
//  addressbook
//
//  Created by Vaghula Krishnan on 2020-08-28.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import Foundation
import Contacts


//enum ContactPermission {
//    case authorised(CNContactStore)
//    case unauthorised
//}

class HelperContacts {
    
    public static let shared = HelperContacts()
    let store = CNContactStore()
    lazy var containerId = self.store.defaultContainerIdentifier()
    lazy var predicate = CNContact.predicateForContactsInContainer(withIdentifier: containerId)
    let keysToFetch = [CNContactGivenNameKey,
                    CNContactMiddleNameKey,
                    CNContactFamilyNameKey,
    CNContactPhoneNumbersKey,
    CNContactEmailAddressesKey,
    CNContactThumbnailImageDataKey,CNContactImageDataAvailableKey] as [CNKeyDescriptor]

    func getContactPermission(completion: @escaping (Bool)->()) {
        let authorizationStatus = CNContactStore.authorizationStatus(for: .contacts)
        
        if authorizationStatus == .notDetermined {
            store.requestAccess(for: .contacts) { didAuthorize,
                error in
                if didAuthorize {
                    completion(true)
                }else{
                    completion(false)
                }
            }
        } else if authorizationStatus == .authorized {
            completion(true)
        }else{
            completion(false)
        }
    }
    
    func retrieveAllContacts(completion: @escaping ([Contacts]?)->()) {
        var arraycontacts:[Contacts] = []
        DispatchQueue.global().async {
            do {
                let contacts = try self.store.unifiedContacts(matching: self.predicate, keysToFetch: self.keysToFetch)
                for item in contacts {
                    print()
                    var contactCopy = Contacts(name: self.getContactName(of: item), email: self.getContactEmail(of: item.emailAddresses), phone: self.getContactPhone(of: item.phoneNumbers))
                    if item.imageDataAvailable {
                        contactCopy.image = item.thumbnailImageData
                    }
                    arraycontacts.append(contactCopy)
                }
                completion(arraycontacts)
            } catch {
                print("Failed to fetch contact, error: \(error)")
                completion(nil)
                // Handle the error
            }
        }
    }
    
    
//    func retrieveContact(name:String, completion: @escaping ([Contacts]?)->()) {
//        var arraycontacts:[Contacts] = []
//
//        DispatchQueue.global().async {
//            do {
//                let predicate = CNContact.predicateForContacts(matchingName: name)
//                let contacts = try self.store.unifiedContacts(matching: predicate, keysToFetch: self.keysToFetch)
//                for item in contacts {
//                    var contactCopy = Contacts(name: item.givenName, email: self.getContactEmail(of: item.emailAddresses), phone: self.getContactPhone(of: item.phoneNumbers))
//                    if item.imageDataAvailable {
//                        contactCopy.image = item.thumbnailImageData
//                    }
//                    arraycontacts.append(contactCopy)
//                }
//                completion(arraycontacts)
//            } catch {
//                print("Failed to fetch contact, error: \(error)")
//                completion(nil)
//                // Handle the error
//            }
//        }
//        
//    }
    
    private func getContactName(of contact:CNContact) -> String {
        
        return "\(contact.givenName) \(contact.middleName) \(contact.familyName)"
    }

    
   private func getContactEmail(of emailObject:[CNLabeledValue<NSString>] ) -> [String]? {
        var email:[String] = []
        for item in emailObject {
            email.append(item.value as String)
        }
        return (email.count == 0) ? nil : email
    }
    
    private func getContactPhone(of phoneObject:[CNLabeledValue<CNPhoneNumber>] ) -> [String]? {
          var phone:[String] = []
          for item in phoneObject {
            phone.append(item.value.stringValue)
          }
          return (phone.count == 0) ? nil : phone
      }
    
}
