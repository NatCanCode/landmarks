//
//  LandmarkList.swift
//  Landmarks
//
//  Created by N N on 16/11/2022.
//

import SwiftUI

struct LandmarkList: View {
    
//  Add an @EnvironmenentObjet property declaration to the view and an environment Object(_:) modifier to the preview.
    @EnvironmentObject var modelData: ModelData
//  @State is a value that can change over time affecting a view's behaviour, content, or layout. Because you use state properties to hold information that's specific to a view and its subviews, you always create state as private.
//  Change the value to true to see how the list reacts.
    @State private var showFavoritesOnly = false
    
//  Compute a filtered version of the list checking the showFavoritesOnly property and each landmark.isFavorite value.
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
//  Use the filtered version of the list of landmarks in the List.
            List {
//  Add a toggle view as the first child of the List view passing a $ binding to show FavoritesOnly.
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                .tint(.accentColor)
                
//  Create a nested ForEach group to transform the landmarks into rows.
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
