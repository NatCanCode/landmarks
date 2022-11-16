//
//  ContentView.swift
//  Landmarks
//
//  Created by N N on 16/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        Makes the object available to any subview.
            .environmentObject(ModelData())
    }
}
