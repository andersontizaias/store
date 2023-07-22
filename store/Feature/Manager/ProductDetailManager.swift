//
//  ProductDetailManager.swift
//  store
//
//  Created by Anderson Tiago Izaias on 12/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

class ProductDetailManager: BaseManager, ProductDetailManagerProtocol {
    
    // MARK: - Properties
    private var productDetailsManagerModel: ProductDetailsManagerModel?
    private var businessProductDetail: ProductDetailBusinessProtocol
    private var businessProductDescription: ProductDescriptionBusinessProtocol
    private var productDetails: ProductItem?
    private var productDescription: ProductDescription?
    var error: Error?
    
    // MARK: - Initializers
    init(businessProductDetail: ProductDetailBusinessProtocol = ProductDetailBusiness(), businessProductDescription: ProductDescriptionBusinessProtocol = ProductDescriptionBusiness()) {
        self.businessProductDetail = businessProductDetail
        self.businessProductDescription = businessProductDescription
        
    }
    
    // MARK: - Public Methods
    func fetchProductDetails(productRequestDetail: ProductDetailRequest, productRequestDescription: ProductDescriptionRequest, completion: @escaping (ProductDetailsManagerModel?, Error?) -> Void) {
        
        addRequest { [weak self] in self?.fetchDetails(request: productRequestDetail) }
        addRequest { [weak self] in self?.fetchDescription(request: productRequestDescription) }
        
        dispatchRequests { [weak self] in
             guard let strongSelf = self else {
                return
             }
            
            if let error = strongSelf.error {
            
                completion(nil, error)
            
            } else {
                let consolidateModel = ProductDetailsManagerModel(productItem: strongSelf.productDetails, productDescription: strongSelf.productDescription)
                 completion(consolidateModel, nil)
            
            }
            
        }
        
    }
    
    // MARK: - Private Methods
    private func fetchDetails(request: ProductDetailRequest) -> RequestProtocol {
        
        let result = self.businessProductDetail.fetchDetails(by: request.productId) { [weak self] (result: ProductItem?, error: Error? ) in
            guard let weakSelf = self else { return }
            
            if let result = result {
                weakSelf.productDetails = result
            }
            
            if let error = error {
                weakSelf.error = error
            }
            
            weakSelf.requestCompleted()
        }
        
        return result
    }
    
    private func fetchDescription(request: ProductDescriptionRequest) -> RequestProtocol {
        
        let result = self.businessProductDescription.fetchProductDecription(by: request.productId) { [weak self] (result: ProductDescription?, error: Error? ) in
            guard let weakSelf = self else { return }
            
            if let result = result {
                weakSelf.productDescription = result
            }
            
            if let error = error {
                 weakSelf.error = error
            }
            
            weakSelf.requestCompleted()
        }
        
        return result
    }
    
}
