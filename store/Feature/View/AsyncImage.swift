//
//  AsyncImage.swift
//  store
//
//  Created by Anderson Tiago Izaias on 26/08/23.
//  Copyright © 2023 Anderson Tiago Izaias. All rights reserved.
//

import SwiftUI
import Combine
import UIKit

struct AsyncImage: View {
    
    @StateObject private var loader: ImageLoader
    
    init(url: String){
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        if let image = loader.image {
            Image(uiImage: image)
                .resizable()
        } else {
            ProgressView()
        }
    }
}

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?
    
    init(url: String) {
            if let imageURL = URL(string: url) {
                cancellable = URLSession.shared.dataTaskPublisher(for: imageURL)
                    .map { UIImage(data: $0.data) }
                    .replaceError(with: nil)
                    .receive(on: DispatchQueue.main)
                    .sink { [weak self] in self?.image = $0 }
            }
        }
}



