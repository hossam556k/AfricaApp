//
//  HeadingView.swift
//  Africa
//
//  Created by MacBook Pro on 24/10/2026.
//

import SwiftUI

struct HeadingView: View {

    // MARK: - PROPERTIES
    var headingImage: String
    var headingText: String

    // MARK: - BODY
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accent)
                .imageScale(.large)

            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

#Preview {
    HeadingView(
        headingImage: "photo.on.rectangle.angled",
        headingText: "Wilderness in Pictures"
    )
}
