//
//  UserDetailsHeader.swift
//  addressbook
//
//  Created by Vaghula Krishnan on 2020-08-29.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit

class UserDetailsHeader: UITableViewHeaderFooterView {

    let viewContactImage:UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .scaleAspectFill
        temp.image = UIImage(named: "avatar")
        return temp
    }()
    
    let labelContactName:UILabel = {
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
        
        contentView.addSubview(viewContactImage)
        
        viewContactImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        viewContactImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        viewContactImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        viewContactImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        viewContactImage.makeRoundedEdges(radius: 150/2)
        
        
        contentView.addSubview(labelContactName)
        
        labelContactName.topAnchor.constraint(equalTo: viewContactImage.bottomAnchor, constant: 20).isActive = true
        //labelContactName.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        labelContactName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        labelContactName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        labelContactName.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        
    }

    
}
