//
//  ProductDetailRequest.swift
//  store
//
//  Created by Anderson Tiago Izaias on 11/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

class ProductDetailRequest: RequestProtocol {
    
    // MARK: - Properties
    var urlPath: String = "/items/"
    var productId: String
    
    // MARK: - Initializers
    init(productId: String) {
        self.productId = productId
    }
    
    // MARK: - Public Methods
    func getFullEndpoitPath() -> String {
        
        let fullEndpoint = "\(ApiConfiguration.shared.baseUrlEndpoint)\(self.urlPath)\(self.productId)"
        return fullEndpoint
    }
}
