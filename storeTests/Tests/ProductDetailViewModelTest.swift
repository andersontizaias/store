//
//  ProductDetailViewModelTest.swift
//  storeTests
//
//  Created by Anderson Tiago Izaias on 18/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//
@testable import store
import XCTest

class ProductDetailViewModelTest: XCTestCase {
    
    var productDetailViewModel: ProductDetailViewModel?
    var manager: ProductDetailManagerProtocol = ProductDetailManagerMock()
    
    override func setUp() {
        super.setUp()
        self.productDetailViewModel = ProductDetailViewModel(manager: self.manager)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetDetailsSuccess() {
        
        self.productDetailViewModel?.getDetails(by: "MLU459925733")
        
        XCTAssertNotNil(self.productDetailViewModel?.productDetails)
        XCTAssertNotNil(self.productDetailViewModel?.productDetails?.productItem)
        XCTAssertNotNil(self.productDetailViewModel?.productDetails?.productDescription)
        XCTAssertTrue(self.productDetailViewModel?.productDetailViewState.value == .loaded)
        
    }

    func testGetDetailsError() {
        
        self.productDetailViewModel?.getDetails(by: "")
        
        XCTAssertNil(self.productDetailViewModel?.productDetails)
        XCTAssertNil(self.productDetailViewModel?.productDetails?.productItem)
        XCTAssertNil(self.productDetailViewModel?.productDetails?.productDescription)
        XCTAssertTrue(self.productDetailViewModel?.productDetailViewState.value == .errorState)
        
    }

}
