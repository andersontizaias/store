//
//  ProductDetailView.swift
//  store
//
//  Created by Anderson Tiago Izaias on 30/08/23.
//  Copyright © 2023 Anderson Tiago Izaias. All rights reserved.
//

import SwiftUI
import Foundation

struct ProductDetailView: View {
    
    @StateObject private var viewModel: ProductDetailsViewModel
    private var product: Product
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init(viewModel: ProductDetailsViewModel = ProductDetailsViewModel(manager: ProductDetailManager()), product: Product) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.product = product
    }
    
    var body: some View {
        ScrollView {
            if viewModel.state == .loading {
                ProgressView()
                    .padding()
                    Spacer()
            
            } else if viewModel.state == .error {
                Text("Erro ao carregar os detalhes do produto")
            } else if viewModel.state == .success {
                productDetails()
            }
        }
        .navigationBarTitle("Detalhes do Produto", displayMode: .inline )
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.black)
        })
        .onAppear {
            viewModel.getDetails(by: product.id)
        }
    
    }
    
    private func formattedPrice(_ price: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "R$"
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        return formatter.string(from: NSNumber(value: price)) ?? "\(price)"
    }
    
    private func productDetails() -> some View {
        VStack(alignment: .leading) {
                
            let url = viewModel.productDetails?.productItem?.pictures.first?.secureUrl ?? ""
            let title = viewModel.productDetails?.productItem?.title ?? ""
            let price = viewModel.productDetails?.productItem?.price ?? 0.0
            let description = viewModel.productDetails?.productDescription?.plainText ?? ""
                
            AsyncImage( url: url)
                .frame(width: 400, height: 500)
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(10)
            Text(formattedPrice(price))
                .font(.title2)
                .fontWeight(.heavy)
                .padding(10)
            Text(description)
                .font(.body)
                .fontWeight(.light)
                .padding(10)
        }
        .padding(5)
    }
}
