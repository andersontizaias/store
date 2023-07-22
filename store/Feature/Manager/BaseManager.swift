//
//  BaseManager.swift
//  store
//
//  Created by Anderson Tiago Izaias on 12/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

typealias RequestFactory = () -> RequestProtocol?

class BaseManager: NSObject {
    private var requests: [RequestProtocol] = []
    private var group = DispatchGroup()
    private var factories: [RequestFactory] = []
    var requestsWereCanceled = false
    
//    func requestWasCanceled(_ appError: AppError) -> Bool {
//        if case let AppError.custom(customError) = appError,
//            case AppError.ignored(_) = customError {
//            return true
//        }
//        return false
//    }
    
    func dispatchRequests(completion: @escaping () -> Void) {
        group.notify(queue: .main) {
            completion()
        }
        for factory in factories {
            if let request = factory() {
                requests.append(request)
            } else {
                group.leave()
            }
        }
    }
    
    func addRequest(_ request: @escaping RequestFactory) {
        requestsWereCanceled = false
        group.enter()
        factories.append(request)
    }
    
    func requestCompleted() {
        group.leave()
    }
    
//    func cancelRequests() {
//        requests.forEach { $0.cancel() }
//        requestsWereCanceled = true
//    }
    
    func resetResources() {
        // cancelRequests()
        requests.removeAll()
        factories.removeAll()
    }
    
//    func handleErrors(_ error: AppError, andAssignToError designatedError:inout AppError?, shouldCancelRequests: Bool = true) {
//        if !requestWasCanceled(error) {
//            if shouldCancelRequests {
//                cancelRequests()
//            }
//            designatedError = error
//        }
//    }
}
