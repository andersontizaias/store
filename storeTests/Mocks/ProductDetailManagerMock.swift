//
//  ProductDetailManagerMock.swift
//  storeTests
//
//  Created by Anderson Tiago Izaias on 18/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation
@testable import store

class ProductDetailManagerMock: ProductDetailManagerProtocol {
    
    func fetchProductDetails(productRequestDetail: ProductDetailRequest, productRequestDescription: ProductDescriptionRequest, completion: @escaping (ProductDetailsManagerModel?, Error?) -> Void) {
        
        if productRequestDetail.productId == "MLU459925733" {
            
            let picture = Picture(id: "", url: "", secureUrl: "", size: "", maxSize: "")
            let picture2 = Picture(id: "", url: "", secureUrl: "", size: "", maxSize: "")
            let pictures = [picture, picture2]
            let productItem = ProductItem(id: "", title: "", price: 0, condition: "", pictures: pictures)
            
            let productDescription = ProductDescription(text: "", plainText: "", lastUpdated: "", date_created: "")
            
            let modelConsolidate = ProductDetailsManagerModel(productItem: productItem, productDescription: productDescription)
            
            completion(modelConsolidate, nil)
        } else {
            
            let error = AppError.parserError
            
            completion(nil, error)
            
        }
    }
    
}
