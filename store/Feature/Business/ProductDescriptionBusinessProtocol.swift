//
//  ProductDescriptionBusinessProtocol.swift
//  store
//
//  Created by Anderson Tiago Izaias on 12/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

protocol ProductDescriptionBusinessProtocol {
    
    func fetchProductDecription(by productId: String, completion: @escaping (ProductDescription?, Error?) -> Void) -> RequestProtocol
}
