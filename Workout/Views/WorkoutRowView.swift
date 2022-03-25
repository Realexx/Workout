//
//  WorkoutRowView.swift
//  Workout
//
//  Created by schlageter alex on 25/03/2022.
//

import SwiftUI

struct WorkoutRowView: View {
    var workout: Workout
    
    var body: some View {
        HStack {
            Text(workout.categorie.symbol)
            Text(workout.date, style: .date)
        }
    }
}
