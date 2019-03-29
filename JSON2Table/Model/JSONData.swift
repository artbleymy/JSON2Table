//
//  JSONData.swift
//  JSON2Table
//
//  Created by Stanislav on 27.03.2019.
//  Copyright © 2019 Stanislav Kozlov. All rights reserved.
//

import Foundation

class JSONData: Codable {
    let title : String?
    let body: String?
    let categories: [JSONData]?
    
    enum CodingKeys: String, CodingKey {
        case title
        case body
        case categories
    }
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
}
