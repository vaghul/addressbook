//
//  ContactTableViewCell.swift
//  addressbook
//
//  Created by Vaghula Krishnan on 2020-08-29.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    private let viewContactImage:UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .scaleAspectFill
        return temp
    }()
    
    private let labelContactName:UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = .semiboldTitle
        temp.textColor = .label
        return temp
    }()
    
    private let lineSeperator:UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .seperatorColor
        return temp
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        
        contentView.addSubview(viewContactImage)
        
        viewContactImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        viewContactImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        //viewContactImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16).isActive = true
        viewContactImage.widthAnchor.constraint(equalToConstant: 42).isActive = true
        viewContactImage.heightAnchor.constraint(equalToConstant: 42).isActive = true
        viewContactImage.makeRoundedEdges(radius: 42/2)
        
        contentView.addSubview(labelContactName)
        
        //labelContactName.topAnchor.constraint(equalTo: viewContactImage.topAnchor, constant: <#T##CGFloat#>)
        labelContactName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        labelContactName.leadingAnchor.constraint(equalTo: viewContactImage.trailingAnchor, constant: 8).isActive = true
        labelContactName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        labelContactName.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        contentView.addSubview(lineSeperator)
        
        lineSeperator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        lineSeperator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        lineSeperator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineSeperator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1).isActive  = true
        
    }
    
    func setContact(value:Contacts) {
        viewContactImage.image = UIImage(named: "avatar")
        if let imageData = value.image {
            viewContactImage.image = UIImage(data: imageData)
        }
        labelContactName.text = value.name
    }
}
