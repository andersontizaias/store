//
//  RequestProtocol.swift
//  store
//
//  Created by Anderson Tiago Izaias on 10/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

protocol RequestProtocol {
    
    // MARK: - Properties
    var urlPath: String { get }
    
    // MARK: - Public Methods
    func getFullEndpoitPath() -> String
    
}
