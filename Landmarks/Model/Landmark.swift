//
//  Landmark.swift
//  Landmarks
//
//  Created by N N on 16/11/2022.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
        
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
//    Add an image property to read the name of the image from the data, and a computed image property that loads an image from the assets.
//    Make the property private because users of the Landmarks structure care only about the image itself.
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
//    Add a coordinates property to the structure using a nested Coordinates type that reflects the storage in the JSON data structure.
//    The proporty is private because you'll use it only to create a public computed property in the next step.
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
