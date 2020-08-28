//
//  ModelProtocol.swift
//  addressbook
//
//  Created by Vaghula Krishnan on 2020-08-28.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import Foundation


protocol ModelDelegate: class {
    
    func recievedResponce(refparam: ApiMethod)
    func errorResponce(_ value: String, refparam: ApiMethod)

}
