//
//  SearchViewModel.swift
//  storeTests
//
//  Created by Anderson Tiago Izaias on 18/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import XCTest

@testable import store 
class SearchViewModelTest: XCTestCase {

    var searchViewModel: SearchViewModelProtocol?
    var searchBusiness: SearchBusinessProtocol = SearchBusinessMock()
    
    override func setUp() {
        super.setUp()
        self.searchViewModel = SearchViewModel(business: self.searchBusiness)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testClearSearchResults() {
        
        self.searchViewModel?.clearSearchResults()
        XCTAssertTrue(self.searchViewModel?.searchResults.isEmpty ?? false)
        XCTAssertTrue(self.searchViewModel?.searchViewState.value == .fullEmptyState)
        XCTAssertTrue(self.searchViewModel?.offset == 0)
        
    }
   
    func testSearchProductsSucess() {
        
        self.searchViewModel?.searchProducts(name: "Chromecast")
        XCTAssertTrue(!(self.searchViewModel?.searchResults.isEmpty ?? true))
        XCTAssertTrue(self.searchViewModel?.searchViewState.value == .loaded)
        
    }
    
    func testSearchProductError() {
        
        self.searchViewModel?.searchProducts(name: "")
        XCTAssertTrue(self.searchViewModel?.searchResults.isEmpty ?? false)
        XCTAssertTrue(self.searchViewModel?.searchViewState.value == .errorState)
        
    }
}
