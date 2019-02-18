//
//  AppError.swift
//  store
//
//  Created by Anderson Tiago Izaias on 17/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation

public enum AppError: Swift.Error {
    case httpError
    case unexpectedError
    case parserError
}
