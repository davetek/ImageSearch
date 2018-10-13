//
//  Photos.swift
//  ImageSearch
//
//  Created by David Lawrence on 10/13/18.
//  Copyright © 2018 clarity for action. All rights reserved.
//

import Foundation

class Photos: Decodable {
    
    let totalHits: Int
    let hits: [Photo]
}
