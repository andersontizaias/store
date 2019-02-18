//
//  ServicesMain.swift
//  store
//
//  Created by Anderson Tiago Izaias on 09/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

class ServiceMain: ServicesProtocol {
    
    // MARK: - Properties
    private var request: RequestProtocol
    private var provider: HttpProviderProtocol
    
    // MARK: - Initializers
    init(request: RequestProtocol ) {
        self.request = request
        self.provider = HttpProvider(request: self.request)
    }
    
    // MARK: - Public Methods
    func fetch<T: Decodable> (completion: @escaping(T?, _ error: Error?) -> Void) {
        
        self.provider.get( completion: { result  in
                
                if let jsonData = try? JSONSerialization.data(withJSONObject: result, options: []) {
                    let decoder = JSONDecoder()
                    
                    do {
                        let search = try decoder.decode(T.self, from: jsonData)
                        completion(search, nil)
                    } catch {
                        completion(nil, AppError.parserError)
                        
                    }
                }
            },
            completionError: { error in
               completion(nil, error)
            })
        
    }

}
