//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by N N on 16/11/2022.
//

import SwiftUI

struct LandmarkRow: View {
//    Add landmark as a stored property of LandmarkRow.
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            Text(landmark.name)
            
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
//        Add the landmark parameter to the LandmarkRow initializer, spécifying the first element of the landmarks array.
//        Use the .previewLayout(_:) modifier to set a size that approximates a row in a list.
//        Use a group, a container for grouping view content.
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
//        Use the .previewLayout(_:) modifier to set a size that approximates a row in a list.
    }
}
