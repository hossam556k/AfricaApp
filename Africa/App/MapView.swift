
//
//  MapView.swift
//  Africa
//
//  Created by MacBook Pro on 23/10/2026.
//



import SwiftUI
import MapKit

struct MapView: View {

    // MARK: - PROPERTIES

    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 6.600286,
                longitude: 16.4377599
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 70.0,
                longitudeDelta: 70.0
            )
        )
    )

    let locations: [MapLocation] = Bundle.main.decode("locations")

    // MARK: - BODY

    var body: some View {
        Map(position: $position) {
            ForEach(locations) { location in
                Annotation(location.name, coordinate: location.location) {
                    MapAnnotationView(location: location)
                }
            }
        }
   
    }
}

#Preview {
    MapView()
}
