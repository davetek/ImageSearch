//
//  ImagesListViewController.swift
//  ImageSearch
//
//  Created by David Lawrence on 10/10/18.
//  Copyright © 2018 clarity for action. All rights reserved.
//

import UIKit

class ImagesListViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    var store: ImageStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchImages()
    }


}

