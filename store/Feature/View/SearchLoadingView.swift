//
//  SearchLoadingView.swift
//  store
//
//  Created by Anderson Tiago Izaias on 15/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Shimmer
import UIKit

class SearchLoadingView: UIView {
    
    // MARK: - Properties
    @IBOutlet private var imageShimmer: UIView!
    @IBOutlet private var titleShimmer: UIView!
    @IBOutlet private var priceShimmer: UIView!
    
    // MARK: - Initiatlizers
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupShimmer()
    }
    
    // MARK: - Private Methods
    private func setupShimmer() {
        
        let shimmerView = FBShimmeringView(frame: self.bounds)
        self.addSubview(shimmerView)
        let transitionView = UIView(frame: self.bounds)
        transitionView.backgroundColor = UIColor.white
        shimmerView.contentView = transitionView
        shimmerView.isShimmering = true
        
    }
}
