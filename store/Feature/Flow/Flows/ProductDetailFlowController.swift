//
//  ProductDetailFlowController.swift
//  store
//
//  Created by Anderson Tiago Izaias on 11/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import UIKit

class ProductDetailFlowController: NSObject, FlowControllable {
    
    // MARK: - Properties
    private let configure: FlowConfig
    var productDetailViewController: ProductDetailViewController?
    
    // MARK: - Initializers
    required init(config: FlowConfig) {
        self.configure = config
        super.init()
    }
    
    // MARK: - Public Methods
    func start(product: Product) {
        start()
        self.productDetailViewController?.product = product
    }
    
    func start() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        self.productDetailViewController = storyBoard.instantiateViewController(withIdentifier: "productDetailViewController") as? ProductDetailViewController
        
        self.configure.navigationController?.pushViewController(self.productDetailViewController ?? UIViewController(), animated: true)
    }
    
}
