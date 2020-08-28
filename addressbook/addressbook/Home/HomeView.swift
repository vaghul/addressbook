//
//  HomeView.swift
//  addressbook
//
//  Created by Vaghula Krishnan on 2020-08-28.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    let barSearch: UISearchBar = {
        let temp = UISearchBar()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.placeholder = "Search Contact"
        temp.searchBarStyle = .minimal
        temp.backgroundColor = .white
        temp.enablesReturnKeyAutomatically = false;

        for item in temp.subviews {
            if item.isKind(of: UITextField.self){
                let search = item as! UITextField
                search.textColor = .white
                search.backgroundColor = .paleGrey
            }
        }

        return temp
    }()
    
    let viewTable:UITableView = {
       let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.keyboardDismissMode = .onDrag
        return temp
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layoutSetup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func layoutSetup() {

        addSubview(barSearch)
        
        barSearch.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor,constant: 10).isActive = true
        barSearch.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        barSearch.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        barSearch.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        addSubview(viewTable)
        
        viewTable.topAnchor.constraint(equalTo: barSearch.bottomAnchor).isActive = true
        viewTable.leadingAnchor.constraint(equalTo: barSearch.leadingAnchor).isActive = true
        viewTable.trailingAnchor.constraint(equalTo: barSearch.trailingAnchor).isActive = true
        viewTable.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor).isActive = true
        
    }
}
