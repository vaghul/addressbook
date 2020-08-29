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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
        self.view = DetailView(frame: self.view.frame)
        
    }
}
