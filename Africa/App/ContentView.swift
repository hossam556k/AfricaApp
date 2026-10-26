//
//  ContentView.swift
//  Africa
//
//  Created by MacBook Pro on 22/10/2026.
//


import SwiftUI
import UIKit

struct ContentView: View {

    // MARK: - PROPERTIES

    let animals: [Animal] = Bundle.main.decode("animals")

    @State private var isGridActive = false

    @State private var gridLayout: [GridItem] = [
        GridItem(.flexible())
    ]

    @State private var gridColumn = 1

    @State private var toolbarIcon = "square.grid.2x2"

    private let haptics = UIImpactFeedbackGenerator(style: .medium)

    // MARK: - FUNCTIONS

    private func gridSwitch() {
        withAnimation(.easeInOut(duration: 0.25)) {
            gridColumn = gridColumn % 3 + 1

            gridLayout = Array(
                repeating: GridItem(.flexible()),
                count: gridColumn
            )

            switch gridColumn {
            case 1:
                toolbarIcon = "square.grid.2x2"
            case 2:
                toolbarIcon = "square.grid.3x2"
            case 3:
                toolbarIcon = "square.grid.1x2"
            default:
                toolbarIcon = "square.grid.2x2"
            }
        }
    }

    private func showList() {
        haptics.impactOccurred()
        isGridActive = false
    }

    private func showGrid() {
        haptics.impactOccurred()

        if !isGridActive {
            isGridActive = true
        } else {
            gridSwitch()
        }
    }

    // MARK: - BODY

    var body: some View {
        NavigationView {
            Group {
                if !isGridActive {

                    // MARK: - LIST VIEW

                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(
                                EdgeInsets(
                                    top: 0,
                                    leading: 0,
                                    bottom: 0,
                                    trailing: 0
                                )
                            )

                        ForEach(animals) { animal in
                            NavigationLink(
                                destination: AnimalsDetailsView(
                                    animal: animal
                                )
                            ) {
                                AnimalListItemView(animal: animal)
                            }
                        }
                        CreditsView()
                            .modifier(CenterModifier())
                    }

                } else {

                    // MARK: - GRID VIEW

                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(
                            columns: gridLayout,
                            alignment: .center,
                            spacing: 10
                        ) {
                            ForEach(animals) { animal in
                                NavigationLink(
                                    destination: AnimalsDetailsView(
                                        animal: animal
                                    )
                                ) {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }
                        .padding(10)
                    }
                }
            }
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {

                ToolbarItemGroup(placement: .navigationBarTrailing) {

                    // MARK: - LIST BUTTON

                    Button(action: showList) {
                        Image(systemName: "square.fill.text.grid.1x2")
                            .font(.title2)
                            .foregroundColor(
                                isGridActive ? .primary : .accentColor
                            )
                    }
                    .accessibilityLabel("List view")

                    // MARK: - GRID BUTTON

                    Button(action: showGrid) {
                        Image(systemName: toolbarIcon)
                            .font(.title2)
                            .foregroundColor(
                                isGridActive ? .accentColor : .primary
                            )
                    }
                    .accessibilityLabel("Grid view")
                }
            }
        }
        .onAppear {
            haptics.prepare()
        }
    }
}

// MARK: - PREVIEW

#Preview {
    ContentView()
}
