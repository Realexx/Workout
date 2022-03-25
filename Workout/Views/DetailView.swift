//
//  DetailView.swift
//  Workout
//
//  Created by schlageter alex on 25/03/2022.
//

import SwiftUI

struct DetailView: View {
    var workout: Workout
    var mapViewModel: MapViewModel
    
    var body: some View {
        
        mapView(mapData: mapViewModel.maps.last!)
        
        HStack {
            
            VStack {
                Text("Distance")
                Text("\(workout.distance)")
            }
            
            VStack {
                Text("Time")
                Text("\(workout.time)")
            }
            
            VStack {
                Text("Speed")
                Text("\(workout.distance/workout.time)")
            }
        }
    }
}


