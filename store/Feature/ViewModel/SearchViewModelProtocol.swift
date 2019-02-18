//
//  SearchViewModelProtocol.swift
//  store
//
//  Created by Anderson Tiago Izaias on 10/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

protocol SearchViewModelProtocol {
    
    var searchViewState: Dynamic<SearchViewState> { get set }
    var searchResults: [Product] { get set }
    var offset: Int { get }
    
    func searchProducts(name: String)
    func clearSearchResults()
}
