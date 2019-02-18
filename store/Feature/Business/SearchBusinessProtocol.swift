//
//  SearchBusinessProtocol.swift
//  store
//
//  Created by Anderson Tiago Izaias on 10/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

protocol SearchBusinessProtocol {
    
    func searchProductsBy(name: String, and offset: Int, completion: @escaping (Search?, Error?) -> Void)
}
