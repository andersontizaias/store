//
//  ProductDetailBusiness.swift
//  store
//
//  Created by Anderson Tiago Izaias on 11/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

class ProductDetailBusiness: ProductDetailBusinessProtocol {
    
    // MARK: - Public Methods
    func fetchDetails(by productId: String, completion: @escaping (ProductItem?, Error?) -> Void) -> RequestProtocol {
        
        let productDetailRequest = ProductDetailRequest(productId: productId)
        let services = ServiceMain(request: productDetailRequest)
        
        services.fetch { (result: ProductItem?, error: Error?) in
        
            if result != nil {
                completion(result, nil)
            } else {
                completion(nil, error)
            }
        }
    
        return productDetailRequest
    }
}
