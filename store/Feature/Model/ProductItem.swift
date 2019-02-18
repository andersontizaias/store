//
//  ProductItem.swift
//  store
//
//  Created by Anderson Tiago Izaias on 11/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

struct Picture: Decodable {
    
    // MARK: - Properties
    var id: String
    var url: String
    var secureUrl: String
    var size: String
    var maxSize: String
    
    // MARK: - Private Enums
    private enum CodingKeys: String, CodingKey {
        case id
        case url
        case secureUrl = "secure_url"
        case size
        case maxSize = "max_size"
    }
}

struct ProductItem: Decodable {
    
    // MARK: - Properties
    var id: String
    var title: String
    var price: Double
    var condition: String
    var pictures: [Picture]
    
    // MARK: - Private Enums
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case condition
        case pictures
    }
}

extension ProductItem {
    
    // MARK: - Initializers
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(String.self, forKey: .id)
        self.title = try values.decode(String.self, forKey: .title)
        self.price = try values.decode(Double.self, forKey: .price)
        self.condition = try values.decode(String.self, forKey: . condition)
        
        if let pictures = try values.decodeIfPresent([Picture].self, forKey: .pictures) {
            self.pictures = pictures
        } else {
            self.pictures = []
        }
                
    }
}
