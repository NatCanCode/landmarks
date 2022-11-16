//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by N N on 16/11/2022.
//

import SwiftUI

@main
struct LandmarksApp: App {
//  Create a model instance and supply it to ContentView using the environmentObject(_:) modifier.
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
