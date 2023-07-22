//
//  SearchLoadingView.swift
//  store
//
//  Created by Anderson Tiago Izaias on 15/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//
import UIKit

class SearchLoadingView: UIView {
    
    // MARK: - Properties
    @IBOutlet public var imageShimmer: UIView!
    @IBOutlet public var titleShimmer: UIView!
    @IBOutlet public var priceShimmer: UIView!
    
    
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
        
        self.imageShimmer.startShimmering()
        self.titleShimmer.startShimmering()
        self.priceShimmer.startShimmering()

    }
}
