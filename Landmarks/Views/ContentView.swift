//
//  ContentView.swift
//  Landmarks
//
//  Created by Евгения Шевцова on 04.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .featured
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem{
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem{
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}

enum Tab {
    case featured
    case list
}
