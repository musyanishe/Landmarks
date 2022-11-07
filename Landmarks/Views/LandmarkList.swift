//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Евгения Шевцова on 04.11.2022.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showOnlyFavorites = true
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showOnlyFavorites || landmark.isFavorite)
        }
    }
    
    var body: some View {
        
        NavigationView {
            List {
                Toggle(isOn: $showOnlyFavorites) {
                    Text("Favorites Only")
                }.tint(.purple)
                
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
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
                    LandmarkList()
                        .previewDevice(PreviewDevice(rawValue: deviceName))
                        .previewDisplayName(deviceName)
        }.environmentObject(ModelData())
    }
}
