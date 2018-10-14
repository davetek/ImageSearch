//
//  ImageStore.swift
//  ImageSearch
//
//  Created by David Lawrence on 10/10/18.
//  Copyright © 2018 clarity for action. All rights reserved.
//

import Foundation

class ImageStore {
    
    //establish variable to hold a Images instance parsed from JSON data
    var images: Images?
        
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    //define function as taking a closure that may not be executed immediately
    // at the same time the function is executed.
    // The closure is called at the end of the session.dataTask closure
    func fetchImages(completionHandler: @escaping () -> Void) {
        let url = PixabayAPI.imageSearchURL
        let request = URLRequest(url: url)
        print(request.description)
        print("")
        //task closure defines task
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
            if let jsonData = data {
                do {
                    //here create JSONDecoder instance and
                    let jsonDecoder = JSONDecoder()
                    
                    //recursively decode the JSON data to the images object instance
                    // which contains a string and a 'hits' array of Image objects
                    self.images = try jsonDecoder.decode(Images.self, from: jsonData)
                   
                    
                    // Now access each Image contained in the Images instance
//                    for image in self.images.hits {
//                        print("\(image.id): \(image.webformatURL)")
//                    }
                    
                    //leave this for debugging
//                    let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
//                    print(jsonObject)
                    
                } catch let error {
                    print("Error creating JSON object: \(error)")
                }
            } else if let requestError = error {
                print("Error fetching images: \(requestError)")
            } else {
                print("Unexpected error with the request")
            }
            
            //call the completion handler in the view controller
            // on the main thread
            DispatchQueue.main.sync {
                completionHandler()
            }
            
        }
        
        //starts background thread to get data
        task.resume()
    }
}
