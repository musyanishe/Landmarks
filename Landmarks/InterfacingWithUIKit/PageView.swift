//
//  PageView.swift
//  Landmarks
//
//  Created by Евгения Шевцова on 09.11.2022.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    @State private var currentPage = 0
    var pages: [Page]
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(currentPage: $currentPage, pages: pages)
            PageControl(currentPage: $currentPage, numberOfPages: pages.count)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map{ FeatureCardView(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
