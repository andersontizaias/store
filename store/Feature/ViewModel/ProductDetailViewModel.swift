//
//  ProductDetailViewModel.swift
//  store
//
//  Created by Anderson Tiago Izaias on 11/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

enum ProductDetailViewState {
    case loading
    case errorState
    case loaded
}
    
class ProductDetailViewModel: ProductDetailViewModelProtocol {
    
    var productDetailViewState = Dynamic<ProductDetailViewState>(.loading)
    var manager: ProductDetailManagerProtocol
    var productDetails: ProductDetailsManagerModel?
        
        init(manager: ProductDetailManagerProtocol) {
            self.manager = manager
        }
        
        func getDetails(by productId: String) {
            
            let productRequestDetail = ProductDetailRequest(productId: productId)
            let productRequestDescription = ProductDescriptionRequest(productId: productId)
            
            self.manager.fetchProductDetails(productRequestDetail: productRequestDetail,
                                             productRequestDescription: productRequestDescription) { [weak self] (result: ProductDetailsManagerModel?, error: Error? ) in
                                                guard let weakSelf = self else { return }
                                                
                                                if error != nil {
                                                    weakSelf.productDetailViewState.value = .errorState
                                                }
                                                
                                                if let result = result {
                                                    weakSelf.productDetails = result
                                                    weakSelf.productDetailViewState.value = .loaded
                                                }
                                                
            }
            
        }

}
