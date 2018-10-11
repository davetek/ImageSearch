//
//  PixabayAPI.swift
//  ImageSearch
//
//  Created by David Lawrence on 10/10/18.
//  Copyright © 2018 clarity for action. All rights reserved.
//

import Foundation


struct PixabayAPI {
    private static let baseURLString = "https://pixabay.com/api/"
    private static let api_key = "10364073-024886ad4327e5203f90b473d"
    
    static var imageSearchURL: URL {
        return pixabayURL(parameters:["q": "tree+oak", "image_type": "photo"])
    }
    
    private static func pixabayURL(parameters: [String:String]?) -> URL {
        //TO DO: use the endpoint string with parameters to construct the URL
        
        var components = URLComponents(string: baseURLString)!
        
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "key": api_key]
        
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        
        components.queryItems = queryItems
        
        return components.url!
    }
}
