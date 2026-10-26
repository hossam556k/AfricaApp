
// CoverImageView.swift
// Africa
//
// Created by MacBook Pro on 23/10/2026.
//

import SwiftUI

struct CoverImageView: View {

   // MARK: - PROPERTIES
   let coverImages: [CoverImage] = Bundle.main.decode("covers")

   // MARK: - BODY
   var body: some View {
       TabView {
           ForEach(coverImages) { item in
               Image(item.name)
                   .resizable()
                   .scaledToFill()
           }
       }
       .tabViewStyle(PageTabViewStyle())
   }
}

#Preview {
   CoverImageView()
}
