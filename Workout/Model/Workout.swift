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
    
    var category: Category
    var time: String
    var distance: String
}
