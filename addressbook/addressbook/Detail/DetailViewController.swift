//
//  DetailViewController.swift
//  addressbook
//
//  Created by Vaghula Krishnan on 2020-08-29.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var viewComponent: DetailView? { return self.view as? DetailView }
    var viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = false
        navigationItem.title = "Contact Information"
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onClickDone))
        // Do any additional setup after loading the view.
        self.view = DetailView(frame: self.view.frame)
        

        viewComponent?.viewTable.rowHeight = 40
        viewComponent?.viewTable.delegate = self
        viewComponent?.viewTable.dataSource = self
        viewComponent?.viewTable.separatorStyle = .none
        
        
        let viewHeader =  UserDetailsHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 220))
        
        if let image = viewModel.getContactImage() {
            viewHeader.viewContactImage.image = image
        }
        viewHeader.labelContactName.text = viewModel.getContactName()
        
        viewComponent?.viewTable.tableHeaderView = viewHeader
        viewComponent?.viewTable.reloadData()
        
        viewComponent?.viewTable.register(ViewTableHeader.self, forHeaderFooterViewReuseIdentifier: ConstantString.shared.TABLEHEADER)
        viewComponent?.viewTable.register(DetailInfoTableViewCell.self, forCellReuseIdentifier: ConstantString.shared.CONTACTCELL)

    }
    
    @objc func onClickDone(){
        self.dismiss(animated: true, completion: nil)
    }
}



extension DetailViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.getNumberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConstantString.shared.CONTACTCELL, for: indexPath) as! DetailInfoTableViewCell
        cell.selectionStyle = .none
        cell.clipsToBounds = true
        if let contact = viewModel.getContent(for: indexPath) {
            cell.setViewElement(title: " \(indexPath.item + 1). \(contact)")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: ConstantString.shared.TABLEHEADER) as? ViewTableHeader else {return nil}

        if let title = viewModel.getHeaderTitle(for: section) {
            view.setHeader(title: title)
        }
        return view
    }
    
    
}
