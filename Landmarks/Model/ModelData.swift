//
//  ModelData.swift
//  Landmarks
//
//  Created by N N on 16/11/2022.
//

import Foundation
import Combine

// Declare a new model type that comforms to the ObservableObject protocol from the Combine framework.
final class ModelData: ObservableObject {
    // Create an array of landmarks that ou initialize from landmarkData.json.
    // Add a @Published attribute to the landmarks array. The ModelData object has been created.
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    @Published var profile = Profile.default
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    // Add a computed categories dictionary w/category names as keys & arrays of associated landmarks.
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

// Create a load(_:) method that fetches JSON data with a given name from the app's main bundle.
// The load method relies on the return type's conformance to the Decodable protocol which is one component of the Codable protocol.
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't find \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't find \(filename) as \(T.self): \n\(error)")
    }
}
