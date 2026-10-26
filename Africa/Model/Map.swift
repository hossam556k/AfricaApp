//
//  Map.swift
//  Africa
//
//  Created by MacBook Pro on 25/10/2026.
//


import Foundation
import MapKit

struct MapLocation: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double

    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
