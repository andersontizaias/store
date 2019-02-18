//
//  SearchViewModel.swift
//  store
//
//  Created by Anderson Tiago Izaias on 10/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

enum SearchViewState {
    case loading
    case errorState
    case fullEmptyState
    case loaded
}

class SearchViewModel: SearchViewModelProtocol {
    
    var searchViewState = Dynamic<SearchViewState>(.fullEmptyState)
    var business: SearchBusinessProtocol
    var searchResults: [Product] = []
    var offset: Int = 0
    var totalPages: Int = 0
    
    init(business: SearchBusinessProtocol ) {
        self.business = business
    }
    
    func searchProducts(name: String) {
        
        self.business.searchProductsBy(name: name, and: offset) {  [weak self] (result: Search?, error: Error? ) in
            guard let weakSelf = self else { return }
            
            if  let result = result {
                weakSelf.searchResults.append(contentsOf: result.results)
                
                if let pagesOfSearch = result.paging?.total {
                    weakSelf.totalPages = pagesOfSearch
                }
                
                if weakSelf.totalPages > weakSelf.offset {
                    weakSelf.offset = weakSelf.offset + 1
                }
                
                if !result.results.isEmpty {
                    weakSelf.searchViewState.value = .loaded
                }
            
            } else {
                if error != nil {
                     weakSelf.searchViewState.value = .errorState
                }
                
            }
        }
        
    }
    
    func clearSearchResults() {
        
        self.searchResults = []
        self.offset = 0
        self.searchViewState.value = .fullEmptyState
        
    }
}
