//
//  ViewTableHeader.swift
//  addressbook
//
//  Created by Vaghula Krishnan on 2020-08-29.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit


class ViewTableHeader: UITableViewHeaderFooterView {

    
    let labelTitle:UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = .semiboldTitle
        temp.textColor = .label
        temp.textAlignment = .center
        return temp
    }()
    
    override init(reuseIdentifier: String?) {
           super.init(reuseIdentifier: reuseIdentifier)
           layoutSetup()
           
       }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func layoutSetup() {
        
        contentView.backgroundColor = .appBackgroundColor
        
        contentView.addSubview(labelTitle)
        
        labelTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        labelTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
    }
    
    func setHeader(title:String) {
        labelTitle.text = title
    }

    
}
