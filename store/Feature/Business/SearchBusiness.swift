//
//  SearchBusiness.swift
//  store
//
//  Created by Anderson Tiago Izaias on 10/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

class SearchBusiness: SearchBusinessProtocol {
    
    // MARK: - Public Methods
    func searchProductsBy(name: String, and offset: Int, completion: @escaping (Search?, Error?) -> Void) {
        
        let request = SearchRequest(sentence: name, offset: offset)
        let services = ServiceMain(request: request)

        services.fetch { (result: Search?, error: Error?) in
            
            if let result = result {
                completion(result, nil)
            } else {
                completion(nil, error)
            }
        }
    
    }
    
}
