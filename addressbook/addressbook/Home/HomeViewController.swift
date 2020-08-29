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
        viewComponent?.barSearch.delegate = self
        viewComponent?.viewTable.separatorStyle = .none
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
        self.showAlert(message: "Contact Fetch Failed")
    }
    
    func recievedResponce(refparam: ApiMethod) {
        viewComponent?.viewTable.reloadData()
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (viewModel.getNumberOfRows() == 0) ? 60 : 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        let view = UIView(frame: CGRect(x: 0, y: 0, width: viewComponent?.frame.width ?? 0, height: 60))
        let label = UILabel(frame: CGRect(x: 0, y: 15, width: viewComponent?.frame.width ?? 0, height: 30))
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.font = .semiboldTitle
        label.text = "No Results Found"
        view.addSubview(label)
        
        return view
    }
    
}


extension HomeViewController:UISearchBarDelegate {
   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {// called when text changes (including clear)
        viewModel.populateFilteredContact(keyword: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        searchBar.resignFirstResponder()
    }
}
