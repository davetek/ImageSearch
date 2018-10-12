//
//  ImageStore.swift
//  ImageSearch
//
//  Created by David Lawrence on 10/10/18.
//  Copyright © 2018 clarity for action. All rights reserved.
//

import Foundation

class ImageStore {
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchImages() {
        let url = PixabayAPI.imageSearchURL
        let request = URLRequest(url: url)
        print(request.description)
        print("")
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
            if let jsonData = data {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
                    print(jsonObject)
                } catch let error {
                    print("Error creating JSON object: \(error)")
                }
            } else if let requestError = error {
                print("Error fetching images: \(requestError)")
            } else {
                print("Unexpected error with the request")
            }
        }
        task.resume()
    }
}
