//
//  DetailInfoTableViewCell.swift
//  addressbook
//
//  Created by Vaghula Krishnan on 2020-08-29.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit

class DetailInfoTableViewCell: UITableViewCell {
    
    
    private let labelTitle:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .mediumSubTitle
        label.textColor = .label
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        contentView.addSubview(labelTitle)
        
        labelTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        labelTitle.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }
    
    func setViewElement(title:String) {
        labelTitle.text = title
    }

    
}
