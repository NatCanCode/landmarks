//
//  MapView.swift
//  Landmarks
//
//  Created by N N on 16/11/2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
//  You use the @State attribute to establish a source of truth for data in your app taht you can modify from more than one view.
//  @State private var region = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
//        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
//    )
    @State private var region = MKCoordinateRegion()

    var body: some View {
//  By prefixing a state variable with $, you pass a binding. When the user interacts with the map, the map updates the region value to match the part of the map that's currently visible in the user interface.
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }

//  Add a method that updates the region based on a coodinate value.
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
