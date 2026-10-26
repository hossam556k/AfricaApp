//
//  GalleryView.swift
//  Africa
//
//  Created by MacBook Pro on 23/10/2026.
//

import SwiftUI
 
struct GalleryView: View {
    // MARK PROPERTIES
    @State private var selectedAnimal: String = "lion"
    
    
    let animals: [Animal] = Bundle.main.decode("animals")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    // SIMPLE GRID
   /* let gridLayout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())

    ]*/
   /* let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)*/
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    var body: some View {
        
        VStack(alignment: .center, spacing: 30) {
            // MARK: - IMAGE
            Image(selectedAnimal)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 8)
                )
            // MARK: - SLIDER
            Slider(value: $gridColumn, in: 2...4, step: 1)
                           .padding(.horizontal)
                           .onChange(of: gridColumn) { _, _ in
                               gridSwitch()
                           }
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = animal.image
                                haptics.impactOccurred()
                                
                            }
                    }
                    .animation(.easeIn)
                    .onAppear(perform: {
                        gridSwitch()
                    })
                   
                }
              
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimatIonView())
    }
    
}

#Preview {
    GalleryView()
}
