//
//  ShimerView.swift
//  store
//
//  Created by Anderson Tiago Izaias on 26/08/23.
//  Copyright © 2023 Anderson Tiago Izaias. All rights reserved.
//

import SwiftUI

struct ShimmerView: View {
    @State private var animation = false
       
       var body: some View {
           LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.5), Color.gray.opacity(0.2), Color.gray.opacity(0.5)]), startPoint: .leading, endPoint: .trailing)
               .mask(
                   RoundedRectangle(cornerRadius: 10)
                       .fill(
                           LinearGradient(gradient: Gradient(colors: [Color.black, Color.white, Color.black]), startPoint: .leading, endPoint: .trailing)
                       )
               )
               .frame(height: 20)
               .offset(x: animation ? 300 : -300)
               .animation(
                   Animation.linear(duration: 1)
                       .repeatForever(autoreverses: false)
               )
               .onAppear() {
                   self.animation.toggle()
               }
       }
}

struct ShimmerRow: View {
    var body: some View {
        HStack {
            ShimmerView()
                .frame(width: 50, height: 50)
                .background(Color.gray.opacity(0.1))

            VStack(alignment: .leading) {
                ShimmerView()
                    .frame(width: 120, height: 20)
                    .background(Color.gray.opacity(0.1))
                ShimmerView()
                    .frame(width: 80, height: 20)
                    .background(Color.gray.opacity(0.1))
            }
        }
    }
}

struct ShimerView_Previews: PreviewProvider {
    static var previews: some View {
       ShimmerRow()
            .frame(minHeight: 44)
    }
}





