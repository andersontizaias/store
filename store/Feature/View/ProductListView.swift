//
//  ProductListView.swift
//  store
//
//  Created by Anderson Tiago Izaias on 20/08/23.
//  Copyright © 2023 Anderson Tiago Izaias. All rights reserved.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject private var viewModel: ProductListViewModel
    @State private var searchText = "" {
        didSet {
            if searchText.isEmpty {
                viewModel.clearSearchResults()
            }
        }
    }
    @State private var selectedProductIndex: Int?
    
    init(viewModel: ProductListViewModel = ProductListViewModel(business: SearchBusiness())) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
            NavigationView {
                VStack {
                    SearchBar(text: $searchText, onCommit: {
                        if !searchText.isEmpty {
                            viewModel.clearSearchResults()
                            viewModel.fetchProducts(query: searchText)
                        }else {
                            viewModel.clearSearchResults()
                        }
                    })
                    .onAppear {
                        searchText = viewModel.firstSearch()
                        viewModel.fetchProducts(query: searchText)
                    }
             
                    if let error = viewModel.error {
                        Text(error)
                            .foregroundColor(.red)
                            .padding(.top)
                    } else {
                        productList
                    }
                    Spacer()
                }
                .navigationBarColor(.yellowMeli)
                .navigationBarTitle("Busca de produtos")
                .background(Color(UIColor.yellowMeli.cgColor))
                .edgesIgnoringSafeArea(.bottom)
                
            }
    }
    
    private var productList: some View {
        List{
            ForEach(viewModel.products.indices, id: \.self) { index in
                
                let product = viewModel.products[index]
                let productDetailsViewModel = ProductDetailsViewModel(manager: ProductDetailManager())
                
                NavigationLink(destination: ProductDetailView(viewModel: productDetailsViewModel, product: product)) {
                    productRow(product: product, index: index)
                }
                .onAppear {
                    if index == viewModel.products.count - 1 {
                        viewModel.fetchProducts(query: searchText)
                    }
                }
            }
            if viewModel.state == .loading {
                ShimmerRow()
                       .frame(minHeight: 44)
            }
        }
    }
    
    private func productRow(product: Product, index: Int) -> some View {
        HStack {
            AsyncImage(url: product.thumbnail)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let viewModel = ProductListViewModel(business: SearchBusiness())
        ProductListView(viewModel: viewModel)
    }
}
