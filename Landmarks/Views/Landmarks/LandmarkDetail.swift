//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by N N on 16/11/2022.
//

import SwiftUI

struct LandmarkDetail: View {
//  Need to access the environment's model data.
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark

//  Compute the index of the input landmark by comparing it with the model data.
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
//  Add the .ignoreSafeArea(edges: .top) modifier to allow the map content to extend to the top edge of the screen
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            CircleImage(image: landmark.image)
//  Vertical offset of -130 points
                .offset(y: -130)
//  Padding of -130 points from the bottom of the view
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
//  Use landmarkIndex with the modelData object to ensure that the button updates the isFavorite property of the landmark stored in the model object.
                }

                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
//  Works with the ModelData object in the environment.
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
