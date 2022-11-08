//
//  HikeBadge.swift
//  Landmarks
//
//  Created by Евгения Шевцова on 08.11.2022.
//

import SwiftUI

struct HikeBadge: View {
    
    var name: String
    
    var body: some View {
        VStack {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1 / 3)
                .frame(width: 100, height:  100)
            //Логика рисования значка дает результат, который зависит от размера кадра, в котором он отображается. Чтобы обеспечить желаемый внешний вид, визуализируйте в кадре размером 300 x 300 точек. Чтобы получить желаемый размер для окончательного графика, масштабируйте визуализированный результат и поместите его в сопоставимо меньший кадр.
            
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name)")
        }
    }
}

struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Preview Testing")
    }
}
