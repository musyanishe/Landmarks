//
//  ModelData.swift
//  Landmarks
//
//  Created by Евгения Шевцова on 04.11.2022.
//

import Combine
import Foundation


final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    @Published var profile = Profile.default 
    
    //сортировка по категориям
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: {$0.category.rawValue})
    }
    
    //фильтрация по особенностям
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
}


func load<T: Decodable>(_ filename: String) -> T {
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename), error is \(error)")
    }
    
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self): \(error)")
    }
    
}
