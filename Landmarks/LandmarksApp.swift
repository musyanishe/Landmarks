//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Евгения Шевцова on 04.11.2022.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
