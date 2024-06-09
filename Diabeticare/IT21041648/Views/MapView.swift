//
//  MapView.swift
//  IT21041648
//
//  Created by Isuru Herath on 2024-06-08.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

let locations = [
    Location(name: "Asiri Central Hospital", coordinate: CLLocationCoordinate2D(latitude: 6.9271, longitude: 79.8612)),
    Location(name: "Nawaloka Hospital", coordinate: CLLocationCoordinate2D(latitude: 6.9270, longitude: 79.8650)),
    Location(name: "Lanka Hospitals", coordinate: CLLocationCoordinate2D(latitude: 6.8914, longitude: 79.8761)),
    Location(name: "Durdans Hospital", coordinate: CLLocationCoordinate2D(latitude: 6.9082, longitude: 79.8525)),
    Location(name: "Hemas Hospital", coordinate: CLLocationCoordinate2D(latitude: 7.0905, longitude: 79.9929)),
    Location(name: "Ninewells Hospital", coordinate: CLLocationCoordinate2D(latitude: 7.2946, longitude: 80.6317)),
    Location(name: "Nawaloka Hospitals", coordinate: CLLocationCoordinate2D(latitude: 6.9271, longitude: 79.8612)),
    Location(name: "Kandy General Hospital", coordinate: CLLocationCoordinate2D(latitude: 7.2938, longitude: 80.6412)),
    Location(name: "Sri Jayawardenepura General Hospital", coordinate: CLLocationCoordinate2D(latitude: 6.8846, longitude: 79.9419)),
    Location(name: "Teaching Hospital Karapitiya", coordinate: CLLocationCoordinate2D(latitude: 6.0535, longitude: 80.2182))
]


struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    )

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { location in
            MapMarker(coordinate: location.coordinate, tint: .red)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    MapView()
}
