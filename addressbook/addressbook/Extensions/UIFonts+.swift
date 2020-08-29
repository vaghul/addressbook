//
//  UIFonts+.swift
//  addressbook
//
//  Created by Vaghula Krishnan on 2020-08-28.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit

extension UIFont {
    
    // used for universal font styling and easy reference
    
    class var boldTitle: UIFont {
        return UIFont.systemFont(ofSize: 18, weight: .bold)
    }
    
    class var semiboldTitle: UIFont {
        return UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    
    class var mediumSubTitle: UIFont {
        return UIFont.systemFont(ofSize: 13, weight: .regular)
    }
}
