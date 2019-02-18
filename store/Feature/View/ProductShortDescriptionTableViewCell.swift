//
//  ProductShortDescriptionTableViewCell.swift
//  store
//
//  Created by Anderson Tiago Izaias on 10/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Kingfisher
import UIKit

class ProductShortDescriptionTableViewCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet private weak var imageThumb: UIImageView!
    @IBOutlet private weak var productDescription: UILabel!
    
    // MARK: - Initializers
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Public Methods
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setupProduct(item: Product ) {
        self.imageThumb.kf.setImage(with: URL(string: item.thumbnail))
        self.productDescription.text = item.title
    }
    
}
