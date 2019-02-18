//
//  ProductDescription.swift
//  store
//
//  Created by Anderson Tiago Izaias on 12/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

struct ProductDescription: Decodable {
    
    // MARK: - Properties
    var text: String
    var plainText: String
    var lastUpdated: String
    var date_created: String
    
    // MARK: - Private Enums
    private enum CodingKeys: String, CodingKey {
        case text
        case plainText = "plain_text"
        case lastUpdated = "last_updated"
        case date_created = "date_created"
    }
}
