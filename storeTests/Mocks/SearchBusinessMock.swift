//
//  SearchBusinessMock.swift
//  storeTests
//
//  Created by Anderson Tiago Izaias on 18/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

@testable import store

class SearchBusinessMock: SearchBusinessProtocol {
    
    func searchProductsBy(name: String, and offset: Int, completion: @escaping (Search?, Error?) -> Void) {
        
        if name == "Chromecast" {
            
            let  product = Product(id: "MLU459154242", title: "Google Chromecast 3 Hdmi 1080p Nuevo Modelo Oferta Loi", thumbnail: "http://mlu-s1-p.mlstatic.com/699949-MLU28995929204_122018-I.jpg")
            let  product2 = Product(id: "", title: "", thumbnail: "")
            let  product3 = Product(id: "", title: "", thumbnail: "")
            let  product4 = Product(id: "", title: "", thumbnail: "")
            let  product5 = Product(id: "", title: "", thumbnail: "")
            
            let products = [product, product2, product3, product4, product5]
            
            let paging = Paging(total: 261, offSet: 0, limit: 50, primaryResults: 261)
            let search = Search(siteId: "MLU", query: "chromecast", paging: paging, results: products)
            
            completion(search, nil)
        } else {
            
            let error = AppError.httpError
            
            completion(nil, error)
        }
        
    }
}
