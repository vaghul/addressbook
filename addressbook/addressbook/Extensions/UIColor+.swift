//
//  UIColor+.swift
//  addressbook
//
//  Created by Vaghula Krishnan on 2020-08-28.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit


extension UIColor {
    
    class var seperatorColor: UIColor {
        return UIColor(named: "seperatorColor")!
    }
    
    class var appBackgroundColor: UIColor {
        return UIColor(named: "BackgroundColor")!
    }
    
    @nonobjc class var paleGrey: UIColor {
        return UIColor(white: 245.0 / 255.0, alpha: 1.0)
    }
}
