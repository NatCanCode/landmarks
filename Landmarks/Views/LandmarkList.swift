//
//  LandmarkList.swift
//  Landmarks
//
//  Created by N N on 16/11/2022.
//

import SwiftUI

struct LandmarkList: View {
//    @State is a value that can change over time affecting a view's behaviour, content, or layout. Because you use state properties to hold information that's specific to a view and its subviews, you always create state as private.
//    Change the value to true to see how the list reacts.
    @State private var showFavoritesOnly = false
    
//    Compute a filtered version of the list checking the showFavoritesOnly property and each landmark.isFavorite value.
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
//            Use the filtered version of the list of landmarks in the List.
            List(filteredLandmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
