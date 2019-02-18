//
//  HttpProvider.swift
//  store
//
//  Created by Anderson Tiago Izaias on 09/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Alamofire

class HttpProvider: HttpProviderProtocol {
    
    // MARK: - Properties
    var request: RequestProtocol
    
    // MARK: - Initializers
    init(request: RequestProtocol ) {
        self.request = request
    }
    
    // MARK: - Public Methods
    func get(completion: @escaping ResponseCompletion, completionError: @escaping ResponseCompletionError) {
        
        Alamofire.request(self.request.getFullEndpoitPath())
            .responseJSON { response in
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling GET on /todos/1")
                    print(response.result.error!)
                    completionError(AppError.httpError)
                    return
                }
                
                // make sure we got some JSON since that's what we expect
                guard let json = response.result.value as? [String: Any] else {
                    print("didn't get todo object as JSON from API")
                    if let error = response.result.error {
                        print("Error: \(error)")
                        completionError(AppError.parserError)
                    }
                    return
                }
                
                completion(json)
            }
    }
}
