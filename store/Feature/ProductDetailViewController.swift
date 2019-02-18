//
//  ProductDetailViewController.swift
//  store
//
//  Created by Anderson Tiago Izaias on 11/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import Kingfisher
import UIKit

class ProductDetailViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: ProductDetailViewModelProtocol?
    
    @IBOutlet private weak var loadingView: UIView!
    @IBOutlet private weak var imageDetailProduct: UIImageView!
    @IBOutlet private weak var titleProduct: UILabel!
    @IBOutlet private weak var decriptionProduct: UILabel!
    @IBOutlet private weak var errorView: UIView!
    private  var shimmerView: FBShimmeringView?
    var product: Product?
    
    // MARK: - Public Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViewModel()
        getData()
    }
    
    // MARK: - private Methods
    private func initializeViewModel() {
        let productDetailManager = ProductDetailManager()
        self.viewModel = ProductDetailViewModel(manager: productDetailManager)
        bindStateView()
    }
    
    private func getData() {
        self.viewModel?.getDetails(by: self.product?.id ?? "")
    }
    
   private func setup() {
    
        if let imageURL = self.viewModel?.productDetails?.productItem?.pictures[0] {
             self.imageDetailProduct.kf.setImage(with: URL(string: (imageURL.secureUrl)))
        }
        
        self.titleProduct.text = self.viewModel?.productDetails?.productItem?.title
        self.decriptionProduct.text = self.viewModel?.productDetails?.productDescription?.plainText
    }
    
    private func setupShimmer() {
        self.loadingView.isHidden = false
        self.shimmerView = FBShimmeringView(frame: self.view.bounds)
        if let shimmer = self.shimmerView {
            self.view.addSubview(shimmer)
            let transitionView = UIView(frame: self.view.bounds)
            transitionView.backgroundColor = UIColor.white
            shimmer.contentView = transitionView
            shimmer.isShimmering = true
        }
    }
    
    private func loading() {
        setupShimmer()
    }

    private func errorState() {
        self.errorView.isHidden = false
    }
    
    private func removeViewLoading() {
        self.loadingView.isHidden = true
        self.shimmerView?.isShimmering = false
        self.shimmerView?.removeFromSuperview()
    }
    
    private func bindStateView() {
        self.viewModel?.productDetailViewState.bind({ [weak self] viewState in
            DispatchQueue.main.async {
                guard let weakSelf = self else { return }
                
                switch viewState {
                case .loading:
                    weakSelf.loading()
                case .errorState:
                    weakSelf.errorState()
                    weakSelf.removeViewLoading()
                case .loaded:
                    weakSelf.setup()
                    weakSelf.removeViewLoading()
                }
            }
        })
    }
    
}
extension UINavigationItem {

    override open func awakeFromNib() {
        super.awakeFromNib()
        let backItem = UIBarButtonItem()
        backItem.title = "Voltar"
        backItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        self.backBarButtonItem = backItem
    }

}
