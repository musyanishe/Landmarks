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
    let id: Int
    let name: String
    let park: String
    let state: String
    let description: String
    let isFavorite: Bool
    
    private var imageName: String //читает имя изображения из данных
    var image: Image {
        Image(imageName)
    } //загружает картинку из ассетов
    
    private var coordinates: Coordinates
    
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    } //взаимодействие с фреймворком MapKit
    
}

struct Coordinates: Hashable, Codable {
    let longitude: Double
    let latitude: Double
}
