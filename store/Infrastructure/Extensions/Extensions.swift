//
//  Extensions.swift
//  store
//
//  Created by Anderson Tiago Izaias on 17/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Foundation
import UIKit


extension String {
    
    // MARK: - Constants
    static let  productShortDescriptionCell = "ProductShortDescriptionTableViewCell"
    static let  productShortDescriptionCellIdentifier = "cell2"
    static let  searchloadingView = "SearchLoadingView"
    static let  searchErrorView = "SearchErrorView"
    
}

extension UIView {
    func startShimmering() {
        let lightColor = UIColor.white.withAlphaComponent(0.1).cgColor
        let darkColor = UIColor.black.cgColor

        let gradient = CAGradientLayer()
        gradient.colors = [lightColor, darkColor, lightColor]
        gradient.frame = CGRect(x: -self.bounds.size.width, y: 0, width: 3 * self.bounds.size.width, height: self.bounds.size.height)
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.525)
        gradient.locations = [0.0, 0.5, 1.0]

        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.duration = 1.5
        animation.repeatCount = Float.infinity

        gradient.add(animation, forKey: "shimmer")

        self.layer.mask = gradient
    }

    func stopShimmering() {
        self.layer.mask = nil
    }
}

extension UIColor {
    
    static var yellowMeli: UIColor {
        return UIColor(red: 251.0/255.0, green:231.0/255.0, blue: 77.0/255.0, alpha: 1.0)
    }
}
