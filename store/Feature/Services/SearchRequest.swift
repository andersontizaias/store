//
//  SearchRequest.swift
//  store
//
//  Created by Anderson Tiago Izaias on 10/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

class SearchRequest: RequestProtocol {

    // MARK: - Properties
    var urlPath: String = "/sites/MLU/search?q=$SENTENCE&offset=$OFFSET"
    var sentence: String
    var offset: Int
    
    // MARK: - Initializers
    init(sentence: String, offset: Int) {
        self.sentence = sentence
        self.offset = offset
    }
    
    // MARK: - Public Methods
    func getFullEndpoitPath() -> String {
        
        let endpoint = "\(ApiConfiguration.shared.baseUrlEndpoint)\(self.urlPath)"
        var finalEndPoint = endpoint.replacingOccurrences(of: "$SENTENCE", with: self.sentence)
        finalEndPoint = finalEndPoint.replacingOccurrences(of: "$OFFSET", with: String(self.offset))
        finalEndPoint = finalEndPoint.replacingOccurrences(of: " ", with: "+")
        
        print(finalEndPoint)
        
        return finalEndPoint
    }
}
