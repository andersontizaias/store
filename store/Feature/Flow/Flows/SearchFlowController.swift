//
//  SearchFlowController.swift
//  store
//
//  Created by Anderson Tiago Izaias on 10/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import UIKit

class SearchFlowController: NSObject, FlowControllable {
    
    // MARK: - Properties
    static let shared = SearchFlowController(config: configure)
    private static var configure: FlowConfig {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("class not found")
        }
        return FlowConfig(window: appDelegate.window, navigationController: appDelegate.navigationController, parent: nil)
    }
    
    private let configure: FlowConfig
    
    // MARK: - Initializers
    required init(config: FlowConfig) {
        self.configure = config
        super.init()
    }
    
    // MARK: - Public Methods
    func start() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let searchViewController = storyBoard.instantiateViewController(withIdentifier: "searchViewController")
        self.configure.navigationController?.pushViewController(searchViewController, animated: true)
    }
}
