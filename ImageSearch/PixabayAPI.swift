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
    
    //New: function that takes search terms entered at run time by user
    // and calls the private function with those parameters to make the URL
    static func imageSearchURL(withUserSearchTerms searchTerms: String?) -> URL {
        guard let searchParameterString = searchTerms else {
            return pixabayURL(parameters: ["q": ""])
        }
        let searchParameter = ["q": searchParameterString]
        return pixabayURL(parameters: searchParameter)
    }
    
    //for hard-coding the search terms into the request URL
//    static var imageSearchURL: URL {
//        return pixabayURL(parameters:["q": "tree+oak" ])
//    }
    
    private static func pixabayURL(parameters: [String:String]?) -> URL {
        //TO DO: use the endpoint string with parameters to construct the URL
        
        var components = URLComponents(string: baseURLString)!
        
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "key": api_key,
            "image_type": "photo"
            ]
        
        //iterate through baseParams & append each key: value pair to queryItems
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        //iterate through additionalParams & append each key: value pair to queryItems
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
