//
//  ProductDetailViewModelProtocol.swift
//  store
//
//  Created by Anderson Tiago Izaias on 11/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

protocol ProductDetailViewModelProtocol {
    
    var productDetailViewState: Dynamic<ProductDetailViewState> { get set }
    var productDetails: ProductDetailsManagerModel? { get set }
    
    func getDetails(by productId: String)
}
