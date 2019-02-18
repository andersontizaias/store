//
//  HttpProviderProtocol.swift
//  store
//
//  Created by Anderson Tiago Izaias on 09/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

// MARK: - TypeAlias
typealias ResponseCompletion = (_ result: [String: Any] ) -> Void
typealias ResponseCompletionError = (_ error: Swift.Error) -> Void

protocol HttpProviderProtocol {
    
    // MARK: - Properties
    var request: RequestProtocol { get set }
    
    // MARK: - Public Methods
    func get(completion: @escaping ResponseCompletion, completionError: @escaping ResponseCompletionError)
    
}
