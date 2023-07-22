//
//  ProductDescriptionRequest.swift
//  store
//
//  Created by Anderson Tiago Izaias on 12/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

class ProductDescriptionRequest: RequestProtocol {
    
    // MARK: - Properties
    var urlPath: String = "/items/$PRODUCTID/description"
    var productId: String
    
    // MARK: - Initializers
    init(productId: String) {
        self.productId = productId
    }
    
    // MARK: - Public Methods
    func getFullEndpoitPath() -> String {
        let fullEndpoint = "\(ApiConfiguration.shared.baseUrlEndpoint)\(self.setUrlEndpoint())"
        return fullEndpoint
    }
    
    // MARK: - Private Methods
    private func setUrlEndpoint() -> String {
        let urlEndpoint = self.urlPath.replacingOccurrences(of: "$PRODUCTID", with: self.productId)
        return urlEndpoint
    }

}
