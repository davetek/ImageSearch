//
//  Photo.swift
//  ImageSearch
//
//  Created by David Lawrence on 10/11/18.
//  Copyright © 2018 clarity for action. All rights reserved.
//

import Foundation

class Image: Decodable {

    //selected fields from initial query response for each photo
    let id: Int
    let type: String
    let tags: String
    let user: String
    let user_id: Int
    let pageURL: URL
    let webformatURL: URL
    let webformatHeight: Int
    let webformatWidth: Int
    let previewURL: URL
    let previewHeight: Int
    let previewWidth: Int
}



