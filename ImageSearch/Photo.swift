//
//  Photo.swift
//  ImageSearch
//
//  Created by David Lawrence on 10/11/18.
//  Copyright © 2018 clarity for action. All rights reserved.
//

import Foundation

class Photo {

    //selected fields from initial query response for each photo
    let id: Int
    let type: String
    let tags: [String]
    let user: String
    let user_id: Int
    let pageURL: URL
    let webformatURL: URL
    let webformatHeight: Int
    let webformatWidth: Int
    let previewURL: URL
    let previewHeight: Int
    let previewWidth: Int
    
    init(id: Int,
         type: String,
         tags: [String],
         user: String,
         user_id: Int,
         pageURL: URL,
         webformatURL: URL,
         webformatHeight: Int,
         webformatWidth: Int,
         previewURL: URL,
         previewHeight: Int,
         previewWidth: Int
    ) {
        self.id = id
        self.type = type
        self.tags = tags
        self.user = user
        self.user_id = user_id
        self.pageURL = pageURL
        self.webformatURL = webformatURL
        self.webformatHeight = webformatHeight
        self.webformatWidth = webformatWidth
        self.previewURL = previewURL
        self.previewHeight = previewHeight
        self.previewWidth = previewWidth
    }
}
