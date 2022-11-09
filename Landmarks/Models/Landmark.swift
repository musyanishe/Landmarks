//
//  Landmark.swift
//  Landmarks
//
//  Created by Евгения Шевцова on 04.11.2022.
//

import CoreLocation
import Foundation
import SwiftUI

struct Landmark: Hashable, Codable, Identifiable {
    
    private var imageName: String //читает имя изображения из данных
    private var coordinates: Coordinates
    
    let id: Int
    let name: String
    let park: String
    let state: String
    let description: String
    var isFavorite: Bool
    var isFeatured: Bool
    var category: Category
    
    var image: Image {
        Image(imageName)
    } //загружает картинку из ассетов
    
   
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    } //взаимодействие с фреймворком MapKit
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    } //опциональное изображение, вернется в случае, если isFeatured будет верно
    
}

struct Coordinates: Hashable, Codable {
    let longitude: Double
    let latitude: Double
}

enum Category: String, Codable {
    case lakes = "Lakes"
    case rivers = "Rivers"
    case mountains = "Mountains"
}
