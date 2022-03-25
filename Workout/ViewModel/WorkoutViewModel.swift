//
//  WorkoutViewModel.swift
//  Workout
//
//  Created by schlageter alex on 25/03/2022.
//

import Foundation

class WorkoutViewModel: ObservableObject {
    @Published var workouts: [Workout] = []
    
    init() {
        getWorkouts()
    }
    
    func getWorkouts() {
        workouts.append(contentsOf: Workout.workoutsData)
    }
    
    func deleteItem(indexSet: IndexSet) {
        workouts.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        workouts.move(fromOffsets: from, toOffset: to)
    }
}
