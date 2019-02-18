//
//  Search.swift
//  store
//
//  Created by Anderson Tiago Izaias on 10/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

struct Product: Decodable {
    
    // MARK: - Properties
    var id: String
    var title: String
    var thumbnail: String
    
    // MARK: - Private Enums
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case thumbnail
    }
}

struct Paging: Decodable {
    
    // MARK: - Properties
    var total: Int
    var offSet: Int
    var limit: Int
    var primaryResults: Int
    
    // MARK: - Private Enums
    private enum CodingKeys: String, CodingKey {
        case total = "total"
        case offSet = "offset"
        case limit = "limit"
        case primaryResults = "primary_results"
    }
    
}

struct Search: Decodable {
    
    // MARK: - Properties
    var siteId: String?
    var query: String?
    var paging: Paging?
    var results: [Product]
    
    // MARK: - Private Enums
    private enum CodingKeys: String, CodingKey {
        case siteId =  "site_id"
        case query = "query"
        case paging = "paging"
        case results = "results"
    }

}

extension Search {
    
    // MARK: - Initializers
    init(from decoder: Decoder) throws {
    
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.siteId = try values.decode(String.self, forKey: .siteId)
        self.query = try values.decode(String.self, forKey: .query)
        if let paging = try values.decodeIfPresent(Paging.self, forKey: .paging) {
            self.paging = paging
        } else {
            self.paging = nil
        }
        if let result = try values.decodeIfPresent([Product].self, forKey: .results) {
            self.results = result
        } else {
            results = []
        }
    }
}
