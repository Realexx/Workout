//
//  Workout.swift
//  Workout
//
//  Created by schlageter alex on 04/03/2022.
//

import Foundation
import SwiftUI

enum Categorie: String, CaseIterable {
    case Riding = "Riding"
    case Running = "Running"
    case Walking = "Walking"
    
    var symbol: String {
        switch self {
        case .Riding:
            return "🚲"
        case .Running:
            return "🐇"
        case .Walking:
            return "🚶🏻"
        }
    }
}

struct Workout: Identifiable {
    var id = UUID()
    
    var categorie: Categorie
    var time: Double
    var distance: Double
    var date: Date
  
    static var workoutsData = [
        Workout(categorie: .Riding, time: 46.00, distance: 300, date: Date()),
        Workout(categorie: .Walking, time: 46.00, distance: 300, date: Date()),
        Workout(categorie: .Running, time: 46.00, distance: 300, date: Date()),
        Workout(categorie: .Riding, time: 46.00, distance: 300, date: Date()),
        
    ]
}


