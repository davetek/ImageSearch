//
//  ImagesListViewController.swift
//  ImageSearch
//
//  Created by David Lawrence on 10/10/18.
//  Copyright © 2018 clarity for action. All rights reserved.
//

import UIKit

class ImagesListViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var store: ImageStore!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let results = store.photos?.hits else {
            print("unable to obtain data")
            return 0
        }
        return results.count

        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imagesTablePrototypeCell", for: indexPath)
        
        if let results = store.photos?.hits {
            let photo = results[indexPath.row]
            cell.textLabel?.text = photo.tags
            cell.detailTextLabel?.text = String(photo.id)
        }
        return cell

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        //pass completion handler to function, which interacts with
        // web service asynchronously, so 'photos' instance is not
        // available immediately. The completion handler is called
        // after the request to the web service is complete
        store.fetchImages(completionHandler: {  [weak self] in
            guard let results = self?.store.photos?.hits else {
                print("error")
                return
            }
            print("Number of images found: \(results.count)")
            self?.tableView.reloadData()
            })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showImageDetails"?:
            if let row = tableView.indexPathForSelectedRow?.row {
                if let results = store.photos?.hits {
                    let photo = results[row]
                    let imageDetailsViewController = segue.destination as! ImageDetailViewController
                    imageDetailsViewController.image = photo
                }
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
        
    }


}

