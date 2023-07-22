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
  
    var product: Product?
    var navigationBar: UINavigationBar!
    
    // MARK: - Public Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
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
        self.loadingView.startShimmering()
    }
    
    private func setupNavigationBar() {
        navigationBar = UINavigationBar(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.height, width: view.frame.width, height: 44))
        
        navigationBar.barTintColor = .yellow
        navigationBar.isTranslucent = false
        
        let navigationItem = UINavigationItem()
        navigationItem.title = "Detalhes do Produto"
        navigationBar.items = [navigationItem]
        
        self.view.addSubview(navigationBar)
        
        if #available(iOS 13.0, *) {
            let statusBar = UIView()
            statusBar.backgroundColor = .yellow
            if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
                window.addSubview(statusBar)
                statusBar.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    statusBar.heightAnchor.constraint(equalToConstant: window.safeAreaInsets.top),
                    statusBar.topAnchor.constraint(equalTo: window.topAnchor),
                    statusBar.leftAnchor.constraint(equalTo: window.leftAnchor),
                    statusBar.rightAnchor.constraint(equalTo: window.rightAnchor)
                ])
            }
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = .yellow
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
        self.loadingView.stopShimmering()
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

    public override func awakeFromNib() {
        super.awakeFromNib()
        let backItem = UIBarButtonItem()
        backItem.title = "Voltar"
        backItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        self.backBarButtonItem = backItem
    }

}
