//
//  FlowControllable.swift
//  store
//
//  Created by Anderson Tiago Izaias on 10/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

protocol FlowControllable {
    
    // MARK: - Initializers
    init(config: FlowConfig)
    
    // MARK: - Public Methods
    func start()
    
}
