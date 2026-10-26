//
//  InsetMapView.swift
//  Africa
//
//  Created by MacBook Pro on 24/10/2026.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    // MARK: - PROPERTIES
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.2, longitudeDelta: 60.0))
    
    
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        
                        Text("Locations")
                            .foregroundColor(.accent)
                          
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                    .background(
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8)
                    )

                }
            )
            .frame(height: 256)
            .cornerRadius(3.0)
    }
}

#Preview {
    InsetMapView()
}
