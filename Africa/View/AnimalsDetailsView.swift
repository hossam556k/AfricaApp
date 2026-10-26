
//
//  AnimalsDetailsView.swift
//  Africa
//
//  Created by MacBook Pro on 24/10/2026.
//

import SwiftUI

struct AnimalsDetailsView: View {

    // MARK: - PROPERTIES
    let animal: Animal

    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                // MARK: - HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()

                // MARK: - TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accent
                            .frame(height: 6)
                            .offset(y: 24)
                    )

                // MARK: - HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accent)
                    .padding(.horizontal)

                // MARK: - GALLERY
                Group {
                    HeadingView(
                        headingImage: "photo.on.rectangle.angled",
                        headingText: "Wilderness in Pictures"
                    )
                    InsetGalleryView(animal: animal)
                }

                // MARK: - FACTS
                Group {
                    HeadingView(
                        headingImage: "questionmark.circle",
                        headingText: "Did you know?"
                    )
                    InsetFactView(animal: animal)
                }

                // MARK: - DESCRIPTION
                Group {
                    HeadingView(
                        headingImage: "info.circle",
                        headingText: "All about \(animal.name)"
                    )
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.accent)
                        .padding()
                        .layoutPriority(1)
                }
                Group {
                    HeadingView(
                        headingImage: "map",
                        headingText: "National Parks"
    
                    )
                    InsetMapView()
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    ExternalWebLinkView(animal: animal)
                }
            }
            .navigationBarTitle(
                "Learn about \(animal.name)",
                displayMode: .inline
            )
        }
    }
}

struct AnimalsDetailsView_Previews: PreviewProvider {

    static let animals: [Animal] = Bundle.main.decode("animals")

    static var previews: some View {
        AnimalsDetailsView(animal: animals[0])
    }
}
