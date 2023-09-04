//
//  ProductDetailsViewModel.swift
//  store
//
//  Created by Anderson Tiago Izaias on 30/08/23.
//  Copyright © 2023 Anderson Tiago Izaias. All rights reserved.
//

import Foundation
import SwiftUI

enum ProductDetailsState {
    case idle
    case loading
    case success
    case error
}


class ProductDetailsViewModel: ObservableObject {
    
    @Published var state: ProductDetailsState = .idle
    @Published var productDetails: ProductDetailsManagerModel?
     var manager: ProductDetailManagerProtocol
    
    init(manager: ProductDetailManagerProtocol) {
        self.manager = manager
    }
    
    func getDetails(by productId: String) {
        
        let productRequestDetail = ProductDetailRequest(productId: productId)
        let productRequestDescription = ProductDescriptionRequest(productId: productId)
        
        self.state = .loading
        
        self.manager.fetchProductDetails(productRequestDetail: productRequestDetail,
                                         productRequestDescription: productRequestDescription) { [weak self] (result: ProductDetailsManagerModel?, error: Error? ) in
                                            guard let weakSelf = self else { return }
                                            
                                            if error != nil {
                                                weakSelf.state = .error
                                            }
                                            
                                            if let result = result {
                                                weakSelf.productDetails = result
                                                weakSelf.state = .success
                                            }
                                            
        }
        
    }
}
