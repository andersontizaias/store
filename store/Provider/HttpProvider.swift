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
    func get<T>(completion: @escaping (T) -> Void, completionError: @escaping ResponseCompletionError) where T: Decodable {
        AF.request(self.request.getFullEndpoitPath())
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let todo):
                    completion(todo)
                case .failure:
                    print("error calling GET on /todos/1")
                    completionError(AppError.httpError)
                }
            }
    }
    
}
