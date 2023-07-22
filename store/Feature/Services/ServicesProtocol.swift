//
//  ServicesProtocol.swift
//  store
//
//  Created by Anderson Tiago Izaias on 10/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

protocol ServicesProtocol {
    
    // MARK: - Public Methods
    func fetch<T: Decodable> (completion: @escaping (T?, _ error: Error?) -> Void) throws
    // func fetch<T: Decodable> (completion: @escaping (T) -> Void, error: Error?)
    
}
