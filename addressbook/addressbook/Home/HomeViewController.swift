//
//  HomeViewController.swift
//  addressbook
//
//  Created by Vaghula Krishnan on 2020-08-28.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var viewComponent: HomeView? { return self.view as? HomeView }
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
        self.view = HomeView(frame: self.view.frame)

        viewModel.delegate = self
        
        viewComponent?.viewTable.rowHeight = 60
        viewComponent?.viewTable.delegate = self
        viewComponent?.viewTable.dataSource = self
        viewComponent?.viewTable.register(ContactTableViewCell.self, forCellReuseIdentifier: ConstantString.shared.CONTACTCELL)
        
        
        HelperContacts.shared.getContactPermission { (isAuthorized) in
            if isAuthorized {
                self.viewModel.populateContacts()
            }else{
                self.showAlert(message: "Contact Permission Not Available")
            }
        }
    }
    
    
}

extension HomeViewController : ModelDelegate {
    
    func errorResponce(refparam: ApiMethod) {
        if refparam == .ContactsList {
            self.showAlert(message: "No Contact Available")
        }else if refparam == .ContactsSearch {
            self.showAlert(message: "No Contact Available")
        }
    }
    
    func recievedResponce(refparam: ApiMethod) {
        if refparam == .ContactsList {
            viewComponent?.viewTable.reloadData()
        }else if refparam == .ContactsSearch {
            viewComponent?.viewTable.reloadData()
        }
    }
}



extension HomeViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConstantString.shared.CONTACTCELL, for: indexPath) as! ContactTableViewCell
        cell.selectionStyle = .none
        cell.clipsToBounds = true
        let contact = viewModel.getContact(for: indexPath)
        cell.setContact(value: contact)
        return cell
    }
    
    
}
