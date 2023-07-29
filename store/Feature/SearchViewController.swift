//
//  SearchViewController.swift
//  store
//
//  Created by Anderson Tiago Izaias on 09/02/2019.
//  Copyright © 2019 Anderson Tiago Izaias. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - Properties
    var viewModel: SearchViewModelProtocol?
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableResults: UITableView!
    
    private var firstSearchItem: String? 
    
    // MARK: - Public Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        initializeViewModel()
        bindStateView()
        firstSearch()
        
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        
        self.searchBar.delegate = self
        self.tableResults.delegate = self
        self.tableResults.dataSource = self
        self.tableResults.tableFooterView = UIView(frame: .zero)
        self.searchBar.backgroundImage = UIImage()
        
    }
    
    private func initializeViewModel() {
        let searchBusiness = SearchBusiness()
        self.viewModel = SearchViewModel(business: searchBusiness)
    }
    
    private func getData(productName: String) {
        self.viewModel?.searchProducts(name: productName)
        self.viewModel?.searchViewState.value = .loading
    } 
    
    private func loading() {
        let nib = UINib(nibName: .searchloadingView, bundle: nil)
        if let loadingView = nib.instantiate(withOwner: self, options: nil).first as? UIView {
             self.tableResults.backgroundView = loadingView
        }
    
    }
    
    private func errorState() {
        let nib = UINib(nibName: .searchErrorView, bundle: nil)
        if let errorView = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            self.tableResults.backgroundView = errorView
        }
    }
    
    private func bindStateView() {
        self.viewModel?.searchViewState.bind({ [weak self] viewState in
            DispatchQueue.main.async {
                guard let weakSelf = self else { return }
                weakSelf.tableResults.backgroundView = nil
                switch viewState {
                case .loading:
                    weakSelf.loading()
                case .errorState:
                    weakSelf.errorState()
                    weakSelf.tableResults.reloadData()
                case .fullEmptyState:
                    weakSelf.tableResults.reloadData()
                case .loaded:
                    weakSelf.tableResults.reloadData()
                }
            }
        })
    }
    
    private func firstSearch() {
        
        let searchListItems = ["Ferramentas","Roupas","Utilidades","Musica","Casa"]
        
        firstSearchItem = searchListItems.randomElement()
        
        if let firstSearchItem {
            getData(productName: firstSearchItem)
            searchBar.text = firstSearchItem
        }
        firstSearchItem = nil
    }
    
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = self.viewModel?.searchResults.count ?? 0
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        var cell = tableView.dequeueReusableCell(withIdentifier: .productShortDescriptionCellIdentifier) as? ProductShortDescriptionTableViewCell
        
        if cell == nil {
            tableView.register(UINib(nibName: .productShortDescriptionCell, bundle: nil), forCellReuseIdentifier: .productShortDescriptionCellIdentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: .productShortDescriptionCellIdentifier) as? ProductShortDescriptionTableViewCell
            
        }
        
        cell?.selectionStyle = .none
        if let item = self.viewModel?.searchResults[indexPath.row] {
            cell?.setupProduct(item: item)
        }
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = self.viewModel?.searchResults[indexPath.row] {
            let productFlow = ProductDetailFlowController(config: FlowConfig(navigationController: self.navigationController, parent: nil))
            productFlow.start(product: item)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let count = self.viewModel?.searchResults.count {
            if indexPath.row == count - 1 {
                getData(productName: searchBar.text ?? "")
            }
        }
    }

}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        getData(productName: searchBar.text ?? "")
        searchBar.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.viewModel?.clearSearchResults()
        }
    }
    
}
