//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Евгения Шевцова on 07.11.2022.
//

import SwiftUI

struct FavoriteButton: View {
    
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "heart.circle.fill" : "heart.circle")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .purple : .gray)
        }

    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
