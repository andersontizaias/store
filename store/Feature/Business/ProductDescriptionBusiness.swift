//
//  ProductDescriptionBusiness.swift
//  store
//
//  Created by Anderson Tiago Izaias on 12/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

class ProductDescriptionBusiness: ProductDescriptionBusinessProtocol {
    
    // MARK: - Public Methods
    func fetchProductDecription(by productId: String, completion: @escaping (ProductDescription?, Error?) -> Void) -> RequestProtocol {
        
        let productDescriptionRequest = ProductDescriptionRequest(productId: productId)
        let services = ServiceMain(request: productDescriptionRequest)
        
        services.fetch { (result: ProductDescription?, error: Error?) in
            
            if result != nil {
                completion(result, nil)
            } else {
                completion(nil, error)
            }
        }
    
        return productDescriptionRequest
    }

}
