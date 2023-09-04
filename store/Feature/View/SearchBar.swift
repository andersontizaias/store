//
//  SearchBar.swift
//  store
//
//  Created by Anderson Tiago Izaias on 20/08/23.
//  Copyright © 2023 Anderson Tiago Izaias. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
   
    @Binding var text: String
    var onCommit: () -> Void
    
    var body: some View{
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $text, onCommit: onCommit)
            .foregroundColor(.primary)
            .keyboardType(.webSearch)
        }
        .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
        .foregroundColor(.secondary)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10.0)
    }
    
    
}
