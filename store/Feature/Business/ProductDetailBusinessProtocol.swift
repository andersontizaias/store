//
//  ProductDetailBusinessProtocol.swift
//  store
//
//  Created by Anderson Tiago Izaias on 11/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

protocol ProductDetailBusinessProtocol {

    func fetchDetails(by productId: String, completion: @escaping (ProductItem?, Error?) -> Void ) -> RequestProtocol
    
}
