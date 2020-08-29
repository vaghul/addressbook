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
        
        // Do any additional setup after loading the view.
        self.view = HomeView(frame: self.view.frame)
        
        viewModel.delegate = self
        
        viewComponent?.viewTable.rowHeight = 60
        viewComponent?.viewTable.estimatedRowHeight = 60
        viewComponent?.viewTable.delegate = self
        viewComponent?.viewTable.dataSource = self
        viewComponent?.barSearch.delegate = self
        viewComponent?.viewTable.separatorStyle = .none
        
        viewComponent?.viewTable.register(ViewTableHeader.self, forHeaderFooterViewReuseIdentifier: ConstantString.shared.TABLEHEADER)
        viewComponent?.viewTable.register(ContactTableViewCell.self, forCellReuseIdentifier: ConstantString.shared.CONTACTCELL)
        
        
        HelperContacts.shared.getContactPermission { (isAuthorized) in
            if isAuthorized {
                self.viewModel.populateContacts()
            }else{
                self.showAlert(message: "Contact Permission Not Available")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true

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
    
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: ConstantString.shared.TABLEHEADER) as? ViewTableHeader else {return nil}
        view.setHeader(title: "No Results Found")
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = viewModel.getContact(for: indexPath)
        let detailVc = DetailViewController()
        detailVc.viewModel.setContact(contact: contact)
        //let nav = UINavigationController(rootViewController: detailVc)
        //nav.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(detailVc, animated: true)
        //present(nav, animated: true, completion: nil)
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
