//
//  FeatureCardView.swift
//  Landmarks
//
//  Created by Евгения Шевцова on 09.11.2022.
//

import SwiftUI

struct FeatureCardView: View {
    
    var landmark: Landmark
    
    var body: some View {
        landmark.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay(content: {
                TextOverlay(landmark: landmark)
            })
    }
}

struct TextOverlay: View {
    
    var landmark: Landmark
    
    var gradient: LinearGradient {
        .linearGradient(
            colors: [.black.opacity(0.6), .black.opacity(0)],
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
    
}

struct FeatureCardView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCardView(landmark: ModelData().features[0])
    }
}
