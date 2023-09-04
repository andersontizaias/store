//
//  ProductListViewModel.swift
//  store
//
//  Created by Anderson Tiago Izaias on 20/08/23.
//  Copyright © 2023 Anderson Tiago Izaias. All rights reserved.
//

import Foundation
import SwiftUI

enum ProductListViewState {
    case idle
    case loading
    case success
    case error
}

class ProductListViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var state: ProductListViewState = .idle
    @Published var error: String?
    var business: SearchBusinessProtocol
    var offset: Int = 0
    var totalPages: Int = 0
    
    init(business: SearchBusinessProtocol ) {
        self.business = business
    }
    
    func fetchProducts(query: String) {
            
            self.state = .loading
            self.business.searchProductsBy(name: query, and: self.offset) {  [weak self] (result: Search?, error: Error? ) in
                guard let self = self else { return }
                
                if  let result = result {
                        self.products.append(contentsOf: result.results)
                        print("quantidade de elementos \(self.products.count)")
                        self.state = .success
                    
                    if let pagesOfSearch = result.paging?.total {
                        self.totalPages = pagesOfSearch
                    }
                    
                    if self.totalPages > self.offset {
                        self.offset = self.offset + 1
                    }
                    
                } else {
                    if error != nil {
                        self.state = .error
                    }
                    
                }
        }
        
    }
    
    func firstSearch()-> String {
        let searchListItems = ["Ferramentas","Roupas","Utilidades","Musica","Casa"]
        return searchListItems.randomElement() ?? ""
    }
    
    func clearSearchResults() {
        self.products = []
        self.offset = 0
        self.state = .idle
    }
}
