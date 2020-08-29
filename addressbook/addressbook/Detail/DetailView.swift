//
//  DetailView.swift
//  addressbook
//
//  Created by Vaghula Krishnan on 2020-08-29.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    let viewTable:UITableView = {
       let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.keyboardDismissMode = .onDrag
        return temp
    }()
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .appBackgroundColor
        layoutSetup()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func layoutSetup() {
        
     
        
        addSubview(viewTable)
        
        viewTable.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor).isActive = true
        viewTable.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        viewTable.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        viewTable.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor).isActive = true
        
        
    }
}
