//
//  WorkoutsView.swift
//  Workout
//
//  Created by schlageter alex on 04/03/2022.
//

import SwiftUI

struct WorkoutsView: View {
    @State var mapViewModel : MapViewModel
    @State var workoutViewModel : WorkoutViewModel
    
    var body: some View {
        
        NavigationView {
            List(Workout.workoutsData) { workout in
                NavigationLink(destination: DetailView(workout: workout, mapViewModel: mapViewModel)) {
                        WorkoutRowView(workout: workout)
                    }
            }
            .navigationTitle("Workouts")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView(mapViewModel: MapViewModel(), workoutViewModel: WorkoutViewModel())
    }
}
