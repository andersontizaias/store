//
//  ProductDetailManagerProtocol.swift
//  store
//
//  Created by Anderson Tiago Izaias on 12/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

protocol ProductDetailManagerProtocol {
    
    func fetchProductDetails(productRequestDetail: ProductDetailRequest, productRequestDescription: ProductDescriptionRequest, completion: @escaping (ProductDetailsManagerModel?, Error?) -> Void)
}
