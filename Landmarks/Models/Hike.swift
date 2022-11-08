//
//  Hike.swift
//  Landmarks
//
//  Created by Евгения Шевцова on 08.11.2022.
//

import Foundation

struct Hike: Codable, Hashable, Identifiable {
    let id: Int
    let name: String
    let distance: Double
    let difficulty: Int
    let observations: [Observation]
    
    static let formatter = LengthFormatter()
    
    var distanceText: String {
        Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }
   
    struct Observation: Codable, Hashable {
        let distanceFromStart: Double
        
        let elevation: Range<Double>
        let pace: Range<Double>
        let heartRate: Range<Double>
    }
    
}


