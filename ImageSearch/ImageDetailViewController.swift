//
//  ImageDetailViewController.swift
//  ImageSearch
//
//  Created by David Lawrence on 10/13/18.
//  Copyright © 2018 clarity for action. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController {
    
    var image: Image!
    
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var tagsTextField: UITextField!
    @IBOutlet var userIdTextField: UITextField!
    @IBOutlet var pageUrlTextField: UITextField!
    @IBOutlet var typeTextField: UITextField!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        //'image' is injected into this view controller
        // in the segue handler in ImagesListViewController
        idTextField.text = String(image.id)
        tagsTextField.text = image.tags
        userIdTextField.text = String(image.user_id)
        pageUrlTextField.text = image.pageURL.absoluteString
        typeTextField.text = image.type
        
    }
}
