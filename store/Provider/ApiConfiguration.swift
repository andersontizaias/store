//
//  ApiConfiguration.swift
//  store
//
//  Created by Anderson Tiago Izaias on 10/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

final class ApiConfiguration: ApiConfigurationProtocol {
    
    // MARK: - Properties
    static let shared = ApiConfiguration()
    
}

extension ApiConfiguration {
    
    // MARK: - Computed Properties
    var baseUrlEndpoint: String {
        let baseUrlEndpoint: String = "https://api.mercadolibre.com"
        return baseUrlEndpoint
    }
    
}
