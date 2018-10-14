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
        guard let results = store.images?.hits else {
            print("unable to obtain data")
            return 0
        }
        return results.count

        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imagesTablePrototypeCell", for: indexPath)
        
        if let results = store.images?.hits {
            let image = results[indexPath.row]
            cell.textLabel?.text = image.tags
            cell.detailTextLabel?.text = String(image.id)
        }
        return cell

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        //pass completion handler to function, which interacts with
        // web service asynchronously, so 'images' instance is not
        // available immediately. The completion handler is called
        // after the request to the web service is complete
        store.fetchImages(completionHandler: {  [weak self] in
            guard let results = self?.store.images?.hits else {
                print("error")
                return
            }
            print("Number of images found: \(results.count)")


            self?.tableView.reloadData()
            })
    }
    
    //segue handler called when the user taps a table row;
    // presents and injects the image data into the ImageDetailViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showImageDetails"?:
            if let row = tableView.indexPathForSelectedRow?.row {
                if let results = store.images?.hits {
                    let image = results[row]
                    let imageDetailsViewController = segue.destination as! ImageDetailViewController
                    imageDetailsViewController.image = image
                }
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
        
    }


}

