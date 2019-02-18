//
//  FlowConfig.swift
//  store
//
//  Created by Anderson Tiago Izaias on 10/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import UIKit

typealias FinishedFlowCallBack = (() -> Void )

class FlowConfig: NSObject {
    
    // MARK: - Properties
    let window: UIWindow?
    var navigationController: UINavigationController?
    let parent: FlowControllable?
    var finishedFlow: FinishedFlowCallBack?
    
    // MARK: - Initiatlizers
    init(window: UIWindow? = nil, navigationController: UINavigationController?, parent: FlowControllable?, finishedFlow: FinishedFlowCallBack? = nil) {
        self.window = window
        self.navigationController = navigationController
        self.parent = parent
        self.finishedFlow = finishedFlow
        super.init()
        
    }

}
