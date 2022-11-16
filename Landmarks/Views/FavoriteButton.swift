//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by N N on 16/11/2022.
//

import SwiftUI

struct FavoriteButton: View {
//  isSet indicates the button current state and provides a constant value for the preview. @Binding propagates the changes made inside this view back to the data source.
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle favorite", systemImage: isSet  ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .accentColor : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
