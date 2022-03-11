//
//  Workout.swift
//  Workout
//
//  Created by schlageter alex on 04/03/2022.
//

enum Type: String, CaseIterable {
    case Bike = "Bike"
    case Running = "Running"
    case Walking = "Walking"
    
}

import Foundation

struct Workout: Identifiable {
    var id = UUID()
    
    var type: Type
    var time: String
    var distance: String
}
